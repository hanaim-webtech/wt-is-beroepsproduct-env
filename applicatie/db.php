<?php 

// Naam van server
$hostname = 'host.docker.internal,1434';
// Naam van database
$dbname = 'movies';
// Je eigen gebruikersnaam
$username = 'sa';
// Je eigen password
$pw = 'abc123!@#';

// Connectie met de RDBMS
$connection_string = 'sqlsrv:Server='. $hostname . ';Database=' . $dbname . ';ConnectionPooling=0';

// Ofwel de $verbinding)
$verbinding = new PDO($connection_string, $username, $pw);


// Zorg ervoor dat eventuele fouttoestanden ook echt als fouten (exceptions) gesignaleerd worden door PHP.
$verbinding->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$data = $verbinding->query("SELECT * FROM movie");

while ($rij = $data->fetch()) 
{
  echo $rij[0];
}
?>