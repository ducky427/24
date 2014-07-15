#!/usr/bin/env python

from bottle import abort, get, run, template
from py2neo.neo4j import GraphDatabaseService, CypherQuery

# Set up a link to the local graph database.
graph = GraphDatabaseService()

@get('/')
def index():
    """ Simply return the index page.
    """
    return template('index')


@get('/char/')
def char_list():
    """ Fetch a list of all known characters, ordered by name and render
    them within the CHAR_LIST template.
    """
    query = "MATCH (c:Character) RETURN c.name AS name ORDER by c.name"
    return template('char_list', chars=CypherQuery(graph, query).execute())


@get('/season/')
def season_list():
    """ Fetch a list of all seasons.
    """
    query = "MATCH (s:Season) RETURN s.name AS name ORDER by s.name"
    return template('season_list', seasons=CypherQuery(graph, query).execute())


@get('/season/<name>')
def season(name):
    """ Display all the characters in a particular season."""
    found = graph.find("Season", "name", name)
    try:
        # Pick up the first node found.
        season = next(found)
    except StopIteration:
        # If no nodes are found, throw a 404.
        abort(404, "Season not found")
    else:
        characters = season.match_incoming("APPEARED_IN")
        return template('season', characters=characters)


@get('/appearances/<num>')
def appearances(num=10):
    query = """MATCH (c:Character)-[a:APPEARED_IN]->(season)
                RETURN c.name as name, sum(a.episodes) AS episodes
                ORDER BY episodes DESC
                LIMIT %s""" % (num,)
    return template('top_appearances', num=num, appearances=CypherQuery(graph, query).execute())


@get('/dangerous/')
def dangerous():
    query = """MATCH (c:Character)-[k:KILLED]->(c2:Character)
                WHERE has(c2.nationality)
                RETURN c2.nationality as name, count(c2.nationality) as num
                ORDER By num desc;"""
    danger = list(CypherQuery(graph, query).execute())
    query2 = """MATCH (c:Character)
                WHERE has(c.nationality)
                RETURN c.nationality as name, count(c.nationality) as num"""
    total_num = list(CypherQuery(graph, query2).execute())
    total_num_dict = {}
    total = 0
    for t in total_num:
        total_num_dict[t.name] = t.num
    result = []
    for d in danger:
        row = dict(name=d.name, num=d.num, pct=100.0*d.num/total_num_dict[d.name])
        result.append(row)
    return template('dangerous', danger=result)

@get('/char/<name>')
def char(name):
    """ Display details of a particular character.
    """
    # Look for a node with a "Character" label and a "name" property
    # matching the name passed in.
    found = graph.find("Character", "name", name)
    try:
        # Pick up the first node found.
        char = next(found)
    except StopIteration:
        # If no nodes are found, throw a 404.
        abort(404, "Character not found")
    else:
        # Otherwise pick up some more data and render a template.
        actor = next(char.match_incoming("STARRED_AS")).start_node
        appearances = char.match_outgoing("APPEARED_IN")
        killed = list(char.match_outgoing("KILLED"))
        killers = list(char.match_incoming("KILLED"))
        if killers:
            killer = killers[0]
        else:
            killer = None

        return template('char', char=char, actor=actor, appearances=appearances,
                        killed=killed, killer=killer)

if __name__ == "__main__":
    run(host="localhost", port=8080, debug=True)

