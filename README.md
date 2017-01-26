### How to use docker2humio

This [image](https://hub.docker.com/r/pmech/docker2humio/) ([on GitHub](https://github.com/pmech/docker2humio)) is a custom version of the standard [fluentd](https://hub.docker.com/r/fluent/fluentd/) image.  It is configured to ship all container logs from a Docker host to Humio.

To use it run the image on all Docker hosts where you wan container logs and start all containers with the fluentd log-driver and probably also set the parser Humio should use to parse the logs.

## docker2humio

To run the image set the env. variables: HUMIO_HOST, HUMIO_TOKEN, and HUMIO_DATASPACE.

Example
```
  $> docker run -p 24224:24224 -e HUMIO_HOST=https://cloud.humio.com:443 -e HUMIO_TOKEN=<INGEST_TOKEN> -e HUMIO_DATASPACE=<DATASPACE> pmech/docker2humio
```


## Containers

To enable log shipping for a container just use the fluentd log-driver and set the parser with the env. log option.

Example
```
  $> docker run --log-driver=fluentd --log-opt env=parser -e parser=<HUMIO_PARSER> <YOUR_IMAGE>
```
