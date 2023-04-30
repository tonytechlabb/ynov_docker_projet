FROM postgres:13
COPY init.sql /docker-entrypoint-initdb.d/

#CMD ["sh", "./entrypoint.sh"]

FROM tonytechlab/myalpine

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
