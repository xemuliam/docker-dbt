![dbt-logo](https://imgur.com/rGpbwpH.png)

# DBT

[Docker](https://www.docker.com/what-docker) image for [DBT-labs (former FishtownAnalytics) data build tool (DBT)](https://www.getdbt.com/product/).

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/xemuliam/dbt) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/xemuliam/dbt) ![Docker Pulls](https://img.shields.io/docker/pulls/xemuliam/dbt)

## Important notice
Since version 1.0.0 my images are optimized for two different architectures: **AMD 64** and **ARM 64**. Last one is really helpful for running on [Apple M1](https://en.wikipedia.org/wiki/Apple_M1) machines.

========

Also please be informed that **since DBT version 1.7.8, the tagging for my images have been changed**.

Now the fully qualified tag looks like this:
```
xemuliam/dbt:1.7.8-bigquery1.7.5
             -----         -----
               |             |
           dbt-core      dbt-bigquery
```
Please take that into account to avoid any misleading


## Latest Spins

- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/bigquery?label=BigQuery&color=blue&logo=googlebigquery) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/bigquery?color=blue)    __= 1.7-bigquery = bigquery__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/snowflake?label=Snowflake&color=lightblue&logo=snowflake) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/snowflake?color=lightblue)   __= 1.7-snowflake = snowflake__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/redshift?label=Redshift&color=orange&logo=amazonredshift) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/redshift?color=orange)   __= 1.7-redshift = redshift__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/synapse?label=Synapse&color=brightgreen&logo=azuredataexplorer) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/synapse?color=brightgreen)   __= 1.7-synapse = synapse__

## Full
<details><summary>Click to expand</summary>
<p>

__I decided to stop maintaining full version of image because of version mixing for each of plugins__

- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/latest?color=brightgreen) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/latest?color=brightgreen)   __= 1.6__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/1.5?color=yellowgreen) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/1.5?color=yellowgreen)   __= 1.5__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/1.4?color=yellow) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/1.4?color=yellow)   __= 1.4__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/1.3?color=orange) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/1.3?color=orange)    __= 1.3__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/1.2?color=red) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/1.2?color=red)    __= 1.2__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/1.1?color=red) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/1.1?color=red)    __= 1.1__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/1.0?color=red) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/1.0?color=red)    __= 1.0__
- ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/xemuliam/dbt/0.21?color=red) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/xemuliam/dbt/0.21?color=red)    __= 0.21__

</p>
</details>

## More

More images you can find on [tags page](https://hub.docker.com/r/xemuliam/dbt/tags?ordering=last_updated)

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
- [Azure Synapse](azure.microsoft.com/products/synapse-analytics)


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

Look into [build script](https://github.com/xemuliam/docker-dbt/blob/main/buildx.sh)


# Enjoy! :)
