
ORACLE_PDB=${ORACLE_PDB:-ORCLPDB1}
ORACLE_USER=${ORACLE_PDB:-SCOTT}

sqlplus -s / as sysdba << EOF
  alter session set container = $ORACLE_PDB;
  create user $ORACLE_USER identified by changeme;
  grant connect, resource to $ORACLE_USER;
  alter user $ORACLE_USER quota unlimited on users;
  exit;
EOF
