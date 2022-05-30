## BUILD
# docker build -t backend:0.1.0 -f backend.dockerfile .
## RUN
# docker run -p 8500:8500 -e ORACLE_PASS=holamundo -e ORACLE_USER=appuser -e ORACLE_CONNSTR=172.17.0.2:1521/xepdb1 -d backend:0.1.0
## Database
# docker run -d -p 1521:1521 -e ORACLE_PASSWORD=holamundo -e APP_USER=appuser -e APP_USER_PASSWORD=holamundo gvenzl/oracle-xe

FROM oraclelinux:8

ENV SERVER_PORT=8500 \
    ORACLE_USER=user \
    ORACLE_PASS=pass \
    ORACLE_CONNSTR=localhost:1521/xepdb1

# Oracle Client Install
# https://docs.oracle.com/en/database/oracle/oracle-database/21/lacli/install-instant-client-using-rpm.html
RUN dnf install oracle-instantclient-release-el8 -y
RUN dnf install oracle-instantclient-basic -y

# Nodejs Install
RUN dnf module install nodejs:16 -y

# COPY APP
COPY . /opt/app

WORKDIR /opt/app

RUN npm install

EXPOSE 8500

CMD ["npm", "start"]
