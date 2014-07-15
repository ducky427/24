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
<h1>Seasons</h1>
<ul>
%for season in seasons:
    <li><a href="/season/{{season.name}}">{{season.name}}</a></li>
%end
</ul>
</div>
</body>
</html>
