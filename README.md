# Example Javascript Application
This a basic javascrip application. The frontend was built with reactjs, the backend with nodejs and express and the database layer with Oracle Database

## How to use it
### Create Oracle Database Container

``` bash
# Docs https://hub.docker.com/r/gvenzl/oracle-xe

docker run -d -p 1521:1521 \
-e ORACLE_PASSWORD=<app_password> \
-e APP_USER=<app_user> \
-e APP_USER_PASSWORD=<sys_password> \
-v oracle-volume:/opt/oracle/oradata \
gvenzl/oracle-xe
```

TODOS:
- Use a SQL init script

### Backend Container

``` bash
docker run -p 8500:8500 -d -e ORACLE_USER=<app_user> -e ORACLE_PASS=<app_password> -e ORACLE_CONNSTR=<your_ip>:1521/xepdb1 backend:0.1.0
```

### Frontend Container

@TODO