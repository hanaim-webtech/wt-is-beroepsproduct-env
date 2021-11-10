FROM mcr.microsoft.com/mssql/server

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=aBc123!@#

# COPY ./setup.sql /db/setup.sql
# # CMD [ "/opt/mssql/bin/sqlservr" ]

# RUN /opt/mssql/bin/sqlservr &

# # RUN sleep 30

# # RUN /opt/mssql-tools/bin/sqlcmd -U sa -P 'aBc123!@#' -l 30 -e -i /db/setup.sql

# CMD [ "sleep 30" ]

COPY entrypoint.sh /

CMD [ "/entrypoint.sh" ]