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
// Ofwel de $verbinding)
$verbinding = new PDO("sqlsrv:Server=$hostname;Database=$dbname;ConnectionPooling=0",
  $username,
  $pw);
// Zorg ervoor dat eventuele fouttoestanden ook echt als fouten (exceptions) gesignaleerd worden door PHP.
$verbinding->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Functie om in andere files toegang te krijgen tot de verbinding.
function verkrijgVerbinding() {
  global $verbinding;
  return verbinding;
}

  $data = $verbinding->query("SELECT * FROM movie");

  while ($rij = $data->fetch()) {
    echo $rij[0];
  }
?>