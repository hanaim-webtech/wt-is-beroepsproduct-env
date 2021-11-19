<?php
require_once 'db_connectie.php';

// maak verbinding met de database (zie db_connection.php)
$db = maakVerbinding();

// haal alle genres op en tel het aantal films van dat genre
$query = 'select G.genre_name as Genre, count(mg.movie_id) as Aantal
          from Genre G left outer join Movie_Genre MG on G.genre_name = MG.genre_name
          group by G.genre_name
          order by G.genre_name';

$data = $db->query($query);

$genre_table = '<table>';
$genre_table = $genre_table . '<tr><th>Genre</th><th>Aantal films</th></tr>';

while($rij = $data->fetch()) {
  $genre = $rij['Genre'];
  $aantal = $rij['Aantal'];
  $genre_table = $genre_table . "<tr><td>$genre</td><td>$aantal</td></tr>";
}

$genre_table = $genre_table . "</table>";
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Movie genres</title>
</head>
<body>
  <h1>Aantal films per genre</h1>
  <?php 
  echo ($genre_table);
  ?>
</body>
</html>