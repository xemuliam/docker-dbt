![dbt-logo](https://imgur.com/rGpbwpH.png)

# DBT

[Docker](https://www.docker.com/what-docker) image for [DBT-labs (former FishtownAnalytics) data build tool (DBT)](https://www.getdbt.com/product/).

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/xemuliam/dbt) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/xemuliam/dbt) ![Docker Pulls](https://img.shields.io/docker/pulls/xemuliam/dbt)


### Full
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/latest?color=red) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/latest?color=red)   __= 0.20 = latest__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/0.19?color=red) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/0.19?color=red)    __= 0.19__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/0.18?color=red) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/0.18?color=red)    __= 0.18__

### Spins
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/bigquery?label=BigQuery&color=blue) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/bigquery?color=blue)    __= 0.20-bigquery = bigquery__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/snowflake?label=Snowflake&color=lightblue) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/snowflake?color=lightblue)   __= 0.20-snowflake = snowflake__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/redshift?label=Redshift&color=orange) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/redshift?color=orange)   __= 0.20-redshift = redshift__



```
 ___________
<    DBT    >
 -----------
    \
     \
      \
                    ##        .
              ## ## ##       ==
           ## ## ## ##      ===
       /""""""""""""""""___/ ===
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
       \______ o          __/
        \    \        __/
          \____\______/
```

# Overview
The main idea is to give possibility to work with DBT without unnesessary components and via Docker way.

The image is more tiny than official one but provides the same functionality.

## Spins
DBT supports several plugins and full docker image contains all of them.

However in most of cases we don't use such stuff because of technological lanscape in our work. Thus you don't need to work with unnecessary plugins and fuctionality.

I've additionaly prepared three spins dedicated to main cloud datawarehouses supported by DBT (all other plugins have been removed at build stage):
- [Google BigQuery](https://cloud.google.com/bigquery)
- [Snowflake](https://www.snowflake.com/cloud-data-platform/)
- [Amazon Redshift](https://aws.amazon.com/redshift)


And those spins are really tiny!

__One spin__ I prepared especially to have the minimal size. It is based on [Alpine linux](https://alpinelinux.org) and contains Google BigQuery plugin only.

![Docker Image Version (tag)](https://img.shields.io/docker/v/fishtownanalytics/dbt/0.19.2?color=orange&label=Official%20DBT%20image) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/fishtownanalytics/dbt/0.19.2?color=red&label=%20) __>>>__ ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/bigquery-alpine?color=green&label=%20) ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/bigquery-alpine?label=My%20Alpine-based%20image%20for%20BigQuery&color=blue)

Feel the difference :)

# What is DBT?

dbt is a development environment that speaks the preferred language of data analysts everywhere—SQL. With dbt, analysts take ownership of the entire analytics engineering workflow, from writing data transformation code to deployment and documentation.

![dbt diadram](https://d33wubrfki0l68.cloudfront.net/18774f02c29380c2ca7ed0a6fe06e55f275bf745/a5007/ui/img/svg/product.svg)

## Official documentation and guides

All official documentation can be found on [DBT Docs](https://docs.getdbt.com/)

# How to build with particular version and/or plugins set

You can build the image with desired plugins set and/or DBT version.

Just grab Dockerfile and build desired version and/or plugins list as build parametes.
If no parameters will be passed into the build then image will be built using all official plugins (BigQuery + Snowflake + Redshift + Postgres) and latest release version from [this page](https://github.com/dbt-labs/dbt/releases).

Version list can be found on [DBT-labs GitHub](https://github.com/dbt-labs/dbt/tags) repo.

`docker build -t <YOUR_TAG>  --build-arg VERSION=<DESIRED_VERSION> --build-arg PLUGINS='bigquery redshift, snowflake' <YOUR_DOCKER_FILE>`

# Enjoy! :)
