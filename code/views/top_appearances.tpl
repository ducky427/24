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
<h1>Top {{num}} Appearances</h1>
<table class="table">
    <tr>
        <th>Actor</th>
        <th>Appearances</th>
    </tr>
    %for appearance in appearances:
    <tr>
        <td><a href="/char/{{appearance.name}}">{{appearance.name}}</a></td>
        <td>{{appearance.episodes}}</td>
    </tr>
    %end
</table>
</div>
</body>
</html>
