--Creating database
SELECT 'CREATE DATABASE kumeudb'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'kumeudb')\gexec

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



--Setting up vineyard
INSERT INTO vineyard(vineyard_id,
  vineyard_name,
  vineyard_location,
  vineyard_size
) VALUES (
  1,
  'kumeu-main',
  'kumeu',
  1
);

--OUR node id set ups 
INSERT INTO node(
  node_id,
  vineyard_id,
  node_name
) VALUES (
  'eui-70b3d57ed005de54',
  1,
  'node 1'
);

INSERT INTO node(
  node_id,
  vineyard_id,
  node_name
) VALUES (
  'eui-70b3d57ed00618ec',
  1,
  'node 2'
);

INSERT INTO node(
  node_id,
  vineyard_id,
  node_name
) VALUES (
  'eui-70b3d57ed006182e',
  1,
  'node 2'
);
