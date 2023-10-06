FROM timescale/timescaledb:latest-pg15


#COPYING OVER INIT FILE
COPY init.sql /docker-entrypoint-initdb.d/

#Exposing the PSQL port
expose 5432