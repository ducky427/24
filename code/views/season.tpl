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
<h1>Characters</h1>
<ul>
%for char in characters:
    <li><a href="/char/{{char.start_node['name']}}">{{char.start_node['name']}}</a></li>
%end
</ul>
</div>
</body>
</html>
