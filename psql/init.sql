--Creating database
CREATE DATABASE IF NOT EXISTS kumeudb;

--Connecting to db
\c kumeudb

-- Creating tables --
-- Create Vineyard table
CREATE TABLE IF NOT EXISTS vineyard(
  vineyard_id INTEGER PRIMARY KEY,
  vineyard_name TEXT NOT NULL,
  vineyard_location TEXT NOT NULL,
  vineyard_size FLOAT NOT NULL
);

-- Create Node table
CREATE TABLE IF NOT EXISTS node(
  node_id TEXT PRIMARY KEY,
  vineyard_id INTEGER REFERENCES VINEYARD(vineyard_id),
  node_name TEXT NOT NULL
);

-- Create Measurement table
CREATE TABLE IF NOT EXISTS measurement(
  measurement_id INTEGER PRIMARY KEY,
  node_id TEXT NOT NULL REFERENCES NODE(node_id),
  timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
  temperature FLOAT,
  humidity FLOAT,
  dew_point FLOAT,
  wind_speed FLOAT,
  leaf_wetness FLOAT,
  rainfall FLOAT
);

ALTER USER postgres WITH PASSWORD ‘postgres’;
ALTER ROLE postgres SET client_encoding TO 'utf8';
GRANT ALL PRIVILEGES ON DATABASE kumeudb TO postgres;
