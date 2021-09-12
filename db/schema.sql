-- As noted previously,the order of table creation is vital due to the dependency of 
-- the candidates table on the existence of a parties.id.In the same regard,the 
-- candidates table must be dropped before the parties table due to the foreign key 
-- constraint that requires the parties table to exist.

DROP TABLE IF EXISTS candidates;
DROP TABLE IF EXISTS parties;
DROP TABLE IF EXISTS voters;

CREATE TABLE parties (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT
);

CREATE TABLE candidates (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  party_id INTEGER,
  industry_connected BOOLEAN NOT NULL,
  CONSTRAINT fk_party FOREIGN KEY (party_id) REFERENCES parties (id) ON DELETE SET NULL
);

CREATE TABLE voters (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  email VARCHAR(50) NOT NULL,
  --  Capture Date and Time Created 
  -- Note that the time will be based on what time it is according to your server,not the client 's machine.
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
