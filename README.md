# pg_repack-docker
Docker image for pg_repack (https://github.com/reorg/pg_repack)

## Build

```
https://github.com/civitaspo/pg_repack-docker.git
cd pg_repack-docker
docker build -t pg_repack .
```

* Change pg_repack vertion according to the pg_repack extention installed in your RDS PostgreSQL.

## Usage

```
docker run -it --rm pg_repack <pg_repack options>
```

* You can see help message via `docker run -it --rm pg_repack --help`
* See [the AWS Document](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.PostgreSQL.CommonDBATasks.html#Appendix.PostgreSQL.CommonDBATasks.pg_repack) for more details.

