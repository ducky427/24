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
<h1>Most Dangerous Nationalities</h1>
<table class="table">
    <tr>
        <th>Country</th>
        <th># of Kills</th>
        <th>%</th>
    </tr>
    %for d in danger:
    <tr>
        <td>{{d['name']}}</td>
        <td>{{d['num']}}</td>
        <td>{{d['pct']}}%</td>
    </tr>
    %end
</table>
</div>
</body>
</html>
