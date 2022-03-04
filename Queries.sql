

CREATE TABLE destinations(
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT PRIMARY KEY,
    average_temp int,
    has_beaches boolean,
    has_mountains boolean,
    cost_of_flight float
);
CREATE TABLE airlines (
    id INT  GENERATED ALWAYS AS IDENTITY,
    name TEXT  PRIMARY KEY
);

INSERT INTO destinations(name,average_temp,cost_of_flight,has_beaches,has_mountains) VALUES  ('Thailand',82,765,true,true);
INSERT INTO destinations(name,average_temp,cost_of_flight,has_beaches,has_mountains) VALUES  ('Minnesota',41,235,false,false);
INSERT INTO destinations(name,average_temp,cost_of_flight,has_beaches,has_mountains) VALUES  ('New Zealand',66,433,true,true);
INSERT INTO destinations(name,average_temp,cost_of_flight,has_beaches,has_mountains) VALUES  ('England',45,290,false,false);
INSERT INTO destinations(name,average_temp,cost_of_flight,has_beaches,has_mountains) VALUES  ('Tristan da Cunha',59,1304,true,true);
INSERT INTO airlines(name) VALUES ('Spirit');
INSERT INTO airlines(name) VALUES ('Lufthansa');
INSERT INTO airlines(name) VALUES ('Delta');
INSERT INTO airlines(name) VALUES ('Southwest');
  --CHALLENGES
--1
SELECT destinations.name FROM destinations;
--2
SELECT destinations.name FROM destinations WHERE destinations.has_beaches =true;  
--3
SELECT destinations.name FROM destinations WHERE destinations.average_temp>60;
--4
SELECT destinations.name FROM destinations WHERE destinations.has_beaches=true AND has_mountains=true;
--5
SELECT destinations.name FROM destinations WHERE destinations.cost_of_flight<500 AND has_mountains=true;
--6
INSERT INTO destinations(name,average_temp,cost_of_flight,has_beaches,has_mountains) VALUES ('Bahamas',78,345,true,false);
--7
UPDATE destinations SET cost_of_flight=1000 WHERE (destinations.name='New Zealand');
--8
DELETE FROM destinations WHERE destinations.name='Minnesota';
--9
UPDATE destinations SET name='Scotland' WHERE (destinations.name='England');
--10
CREATE TABLE airlines_destinations(
    airline TEXT,
    destination TEXT,
    FOREIGN KEY (airline) REFERENCES airlines(name),
    FOREIGN KEY (destination) REFERENCES destinations(name)
);
INSERT INTO airlines_destinations VALUES('Spirit','New Zealand');
INSERT INTO airlines_destinations VALUES('Spirit','Scotland');
INSERT INTO airlines_destinations VALUES('Lufthansa','Tristan da Cunha');
INSERT INTO airlines_destinations VALUES('Lufthansa','Scotland');
INSERT INTO airlines_destinations VALUES('Lufthansa','Thailand');
INSERT INTO airlines_destinations VALUES('Delta','Thailand');
INSERT INTO airlines_destinations VALUES('Delta','Minnesota');
INSERT INTO airlines_destinations VALUES('Delta','England');
INSERT INTO airlines_destinations VALUES('Delta','Scotland');
INSERT INTO airlines_destinations VALUES('Southwest','New Zealand');
INSERT INTO airlines_destinations VALUES('Southwest','Tristan da Cunha');
INSERT INTO airlines_destinations VALUES('Southwest','Minesota');
--11
SELECT airlines_destinations.airline
FROM airlines_destinations WHERE airlines_destinations.destination='New Zealand';
--12
SELECT DISTINCT airlines_destinations.airline FROM airlines_destinations 
WHERE airlines_destinations.destination!='Scotland';
--13
SELECT *FROM destinations;
