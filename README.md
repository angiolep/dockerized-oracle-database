# oracle-database-docker

This project provides some few docker files to build images for Oracle databases.

It's been copied from the official [oracle/docker-images](https://github.com/oracle/docker-images)

## 12c release 1 standard edition 2

Download the following 2 files

* ``linuxamd64_12102_database_se2_1of2.zip``
* ``linuxamd64_12102_database_se2_2of2.zip``

from the official [Oracle website](http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html) and place them under the ``12.1.0.2-se2`` directory.

### build
Thereafter, build the image as follows:

```bash
cd 12.1.0.2-se2
docker build -t oracle/database:12.1.0.2-se2 .
```

### run
When build completes, run the Oracle database as follows:

```
docker run --name oracle \
   -p 1521:1521 -p 5550:5550 \
   -e ORACLE_PWD=manager \
   -e ORACLE_SID=orcl \
   -e ORACLE_PDB=pdb1 \
   -e ORACLE_USER=scott \
   -v $PWD/oradata:/opt/oracle/oradata \
   -v $PWD/scripts:/opt/oracle/scripts/setup \
   oracle/database:12.1.0.2-se2
```

### connect
Let your Java application connect to the database using the following JDBC url:

```
jdbc:oracle:thin:scott/changeme@localhost:1521/pdb1
```
