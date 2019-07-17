USE bristol_php_training;

DROP TABLE IF EXISTS events;

CREATE TABLE events (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO events
	(name)
VALUES
	('Unit testing with PHPUnit'),
	('Mocking and stubbing'),
	('Docker for PHP Development'),
	('End to End testing in Cypress'),
	('An introduction to SPAs in Vue'),
	('Dockerize your dev environment');
