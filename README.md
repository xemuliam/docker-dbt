![dbt-logo](https://imgur.com/rGpbwpH.png)

# DBT

## Full
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/latest)    __= 0.19 = latest__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/0.18.2)    __= 0.18__

## Spins
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/bigquery?label=Google%20BigQuery&color=blue)   __bigquery__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/snowflake?label=Snowflake&color=lightblue)   __snowflake__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/redshift?label=Amazon%20Redshift&color=orange)   __redshift__


[Docker](https://www.docker.com/what-docker) image for [FishtownAnalytics DBT](https://www.getdbt.com/product/).

- ![Docker builds](https://img.shields.io/docker/automated/xemuliam/dbt.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/xemuliam/dbt.svg) ![Docker Stars](https://img.shields.io/docker/stars/xemuliam/dbt.svg)

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


And those speens are very tiny!
Feel the difference :)

# What is DBT?

dbt is a development environment that speaks the preferred language of data analysts everywhere—SQL. With dbt, analysts take ownership of the entire analytics engineering workflow, from writing data transformation code to deployment and documentation.

![dbt diadram](https://d33wubrfki0l68.cloudfront.net/18774f02c29380c2ca7ed0a6fe06e55f275bf745/a5007/ui/img/svg/product.svg)

## Official documentation and guides

All official documentation can be found on [DBT Docs](https://docs.getdbt.com/)

# How to build with particular version and/or plugins set

You can build the image with desired plugins set and/or DBT version.

Just grab Dockerfile and put desired version and/or plugins list as build parametes.
If no parameters will be passed into the build then image will be built using full plugins set and version from ARD stetaement from Docker file.

Versionl list can be found in [DBT GitHub](https://github.com/fishtown-analytics/dbt/tags) repo.

`docker build -t <YOUR-TAG>  --build-arg VERSION=<DESIRED.VERSION> --build-arg PLUGINS='bigquery redshift, snowflake'`

# Enjoy! :)
