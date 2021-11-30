<?php

// defined in 'variables.env'
$db_host = 'database_server'; // de database server 
$db_name = 'movies';                    // naam van database

// defined in sql-script 'movies.sql'
$db_user    = 'applicatie';                 // db user
$db_password = 'testpassword!Hallo-1244!';  // wachtwoord db user


$verbinding = new PDO('sqlsrv:Server=' . $db_host . ';Database=' . $db_name . ';ConnectionPooling=0;', $db_user, $db_password);

// Bewaar het wachtwoord niet langer onnodig in het geheugen van PHP.
unset($db_password);

// Zorg ervoor dat eventuele fouttoestanden ook echt als fouten (exceptions) gesignaleerd worden door PHP.
$verbinding->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Functie om in andere files toegang te krijgen tot de verbinding.
function maakVerbinding() {
  global $verbinding;
  return $verbinding;
}

?>