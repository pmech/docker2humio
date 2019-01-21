
**This repo is deprecated!**

**Use this: https://docs.humio.com/integrations/platform-integrations/docker/ instead!**


Deprecated! docker2humio - Humio log shipper image
==================================================

Ship all your container logs to humio.

Overview
--------

This [image](https://hub.docker.com/r/pmech/docker2humio/) ([GitHub](https://github.com/pmech/docker2humio)) is a custom version of the standard [fluentd](https://hub.docker.com/r/fluent/fluentd/) image.  It is configured to ship all container logs from a Docker host to Humio.

To use it just run the shipper image and configure all application containers on the host to use the fluentd log-driver and also set the log type.


Setup log shipper - docker2humio
--------------------------------

To run the shipper image set the env. variables: HUMIO_HOST, HUMIO_TOKEN, and HUMIO_DATASPACE.

Example
```
  $> docker run -p 24224:24224 -e HUMIO_HOST=https://cloud.humio.com:443 -e HUMIO_TOKEN=<INGEST_TOKEN> -e HUMIO_DATASPACE=<DATASPACE> pmech/docker2humio
```


Configure Application Containers
--------------------------------

To enable log shipping for a container just use the fluentd log-driver and set the log type with the env. log option, then the shipper container will do the rest.

Example
```
  $> docker run --log-driver=fluentd --log-opt env=@type -e @type=<HUMIO_PARSER> <YOUR_IMAGE>
```
