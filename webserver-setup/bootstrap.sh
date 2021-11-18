#!/bin/bash
# set -x

# based on: 
# https://stackoverflow.com/questions/58279183/how-do-i-check-that-a-sql-server-linux-database-is-up-and-running

sleep 10 # wait for sql server to start up

# 20 retries....
i=0
while [ $i -le 20 ]; do
    echo "$i: test db"
    # Check if Database already exists
    RESULT=$(/opt/mssql-tools/bin/sqlcmd -S "$DB_HOST" -U sa -P "$SA_PASSWORD" -Q "IF DB_ID('$DB_NAME') IS NOT NULL print 'YES'")
    CODE=$?

    if [ "$RESULT" = "YES" ]; then
        echo ""
        echo "---------------------------------------------"
        echo "-                                           -"
        echo "- $i: Database exists, webserver starting!  -"
        echo "-                                           -"
        echo "---------------------------------------------"
        php -S 0.0.0.0:80 -t /applicatie/
        break # exit for loop

    elif [ $CODE -eq 0 ] && [ "$RESULT" = "" ]; then
    echo ""
        echo "-------------------------------------------------------"
        echo "-                                                     -"
        echo "- $i: Server available, creating database '$DB_NAME'  -"
        echo "-                                                     -"
        echo "-------------------------------------------------------"
        /opt/mssql-tools/bin/sqlcmd -S "$DB_HOST" -U sa -P "$SA_PASSWORD" -i /setup/movies.sql
        echo "-------------------------------------------------------"
        echo "-                                                     -"
        echo "- $i: Database created '$DB_NAME'                     -"
        echo "-                                                     -"
        echo "-------------------------------------------------------"
        # no break, let run the loop again, line 13 should return 'YES'

    # If the code is different than 0, an error occured. (most likely database wasn't online) Retry.
    else
        echo "-------------------------------------------------------"
        echo "-                                                     -"
        echo "- $i: Database not ready yet...                       -"
        echo "-                                                     -"
        echo "-------------------------------------------------------"
        sleep 5
    fi
    i=$(( i + 1 ))
done

echo "-------------------------------------------------------------------------"
echo "-                                                                       -"
echo "- $i: webserver stopped or something went wrong connecting to database  -"
echo "-                                                                       -"
echo "-------------------------------------------------------------------------"
