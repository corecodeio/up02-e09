## Build
# docker build -t backend:0.1.0 -f back.dockerfile .
## Run
# docker run -p 8500:8500 -d -e ORACLE_USER=appuser -e ORACLE_PASS=mispassword -e ORACLE_CONNSTR=172.17.0.2:1521/xepdb1 backend:0.1.0

FROM oraclelinux:8.6

# Install Oracle client
# https://www.oracle.com/au/database/technologies/instant-client/linux-x86-64-downloads.html#ic_x64_inst
# https://docs.oracle.com/en/database/oracle/oracle-database/21/lacli/install-instant-client-using-rpm.html
RUN dnf install oracle-instantclient-release-el8 -y
RUN dnf install oracle-instantclient-basic -y

# Install Nodejs
RUN dnf module install nodejs:16 -y

ENV SERVER_PORT=8500 \
    ORACLE_USER=user \
    ORACLE_PASS=pass \
    ORACLE_CONNSTR=localhost:1521/orclpdb

# Copy application
COPY . /opt/app

WORKDIR /opt/app

RUN npm install

CMD ["npm", "start"]