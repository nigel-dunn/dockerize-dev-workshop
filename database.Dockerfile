FROM mysql:5

COPY docker/character_set.cnf /etc/mysql/mysql.conf.d/
