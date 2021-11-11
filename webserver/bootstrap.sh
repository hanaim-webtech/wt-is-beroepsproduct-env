#!/bin/bash
set -x
# https://stackoverflow.com/questions/58279183/how-do-i-check-that-a-sql-server-linux-database-is-up-and-running

/opt/mssql/bin/sqlservr &

sleep 20

for i in {1..20}; do
    echo "$i: test db"
    # Check if Database already exists
    RESULT=$(/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -Q "IF DB_ID('$DB_NAME') IS NOT NULL print 'YES'")
    CODE=$?

    if [ "$RESULT" = "YES" ]; then
        echo "$I: Do Something."
        break

    elif [ $CODE -eq 0 ] && [ "$RESULT" = "" ]; then
        echo "$i: If this comes up, the database doesn't exist"
        /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -Q "use master; CREATE DATABASE $DB_NAME;"
        break

    # If the code is different than 0, an error occured. (most likely database wasn't online) Retry.
    else
        echo "$i: Database not ready yet..."
        sleep 1
    fi
done

# just do nothing
while sleep 1000; 
    do :;
done
