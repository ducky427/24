<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<h1>{{char["name"]}}</h1>
<dl>
    <dt>Played by:</dt>
    <dd>{{actor["name"]}}</dd>
    <dt>Alive?:</dt>
    <dd>{{char["alive"]}}</dd>
    <dt>Nationality:</dt>
    <dd>{{char["nationality"]}}</dd>
    <dt>Appearances:</dt>
    <dd>
        <ul>
        %for appearance in appearances:
            <li>{{appearance.end_node["name"]}} ({{appearance["episodes"]}} episodes)</li>
        %end
        </ul>
    </dd>
    %if killer:
    <dt>Killer:</dt>
    <dd><a href="/char/{{killer.start_node['name']}}">{{killer.start_node['name']}}</a></dd>
    %end
    %if killed:
    <dt>Killed:</dt>
    <dd>
        <ul>
        %for k in killed:
            <li><a href="/char/{{k.end_node['name']}}">{{k.end_node['name']}}</a></li>
        %end
        </ul>
    </dd>
    %end
</dl>
<p><a href="/char/">Return to character list</a></p>
</div>
</body>
</html>
