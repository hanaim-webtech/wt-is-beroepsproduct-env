<?php

// defined in 'variables.env'
$db_host = 'database_server'; // de database server 
$db_name = 'gelreairport';                    // naam van database

// defined in sql-script 'movies.sql'
$db_user    = 'sa';                 // db user
$db_password = 'abc123!@#';  // wachtwoord db user

// Het 'ssl certificate' wordt altijd geaccepteerd (niet overnemen op productie, verder dan altijd "TrustServerCertificate=1"!!!)
$verbinding = new PDO('sqlsrv:Server=' . $db_host . ';Database=' . $db_name . ';ConnectionPooling=0;TrustServerCertificate=1', $db_user, $db_password);

// Bewaar het wachtwoord niet langer onnodig in het geheugen van PHP.
unset($db_password);

// Zorg ervoor dat eventuele fouttoestanden ook echt als fouten (exceptions) gesignaleerd worden door PHP.
$verbinding->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Functie om in andere files toegang te krijgen tot de verbinding.
function maakVerbinding() {
  global $verbinding;
  return $verbinding;
}



$pdo = maakVerbinding();

try{
$sh = $pdo->prepare( "EXEC sp_columns medewerkers");
$sh->execute();
    // tabel bestaat, maak gebruiker aan.
    $uid = 1;
    $username = "Richard"; //de gebruikersnaam van de medewerker die wordt toegevoegd
    $password = 'hellokitty';

    $hash = password_hash($password, PASSWORD_DEFAULT); //het wachtwoord voor de gebruiker.
    $sql = "INSERT INTO medewerkers (uid,password,naam) VALUES ('".$uid."',N'".$hash."',N'".$username."');";
    $sh = $pdo->prepare($sql);
    $sh->execute();

    echo "Gebruiker " .$username. " is aangemaakt met als uid ".$uid." en als wachtwoord " . $password;
}catch(PDOException $exception) {
    // medewerkerstabel bestaat nog niet, maak hem  aan!
    $sql = "
    CREATE TABLE medewerkers (
            uid int NOT NULL PRIMARY KEY,
            password varchar(128),
            naam varchar(50)
        )
    ";

    $sh = $pdo->prepare($sql);
    $sh->execute();

    echo "Bezig met het schrijven van de tabel medewerkers.";
    //verversen voor het aanmaken van de gebruiker
    header("Refresh:2");
}



?>