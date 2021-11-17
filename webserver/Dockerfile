FROM php:8.0-cli-alpine3.14

# install additional software and drivers
COPY ./init-container.sh /setup/
RUN /setup/init-container.sh

# Setting up DB environment
COPY ./movies.sql /setup/
COPY ./bootstrap.sh /setup/

ENTRYPOINT [ "sh", "/setup/bootstrap.sh" ]