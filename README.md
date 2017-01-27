
docker2humio - log shipper image
================================

Ship all your container logs to humio.

This [image](https://hub.docker.com/r/pmech/docker2humio/) ([GitHub](https://github.com/pmech/docker2humio)) is a custom version of the standard [fluentd](https://hub.docker.com/r/fluent/fluentd/) image.  It is configured to ship all container logs from a Docker host to Humio.

To use it just run the shipper image and configure all application containers on the host to use the fluentd log-driver. Also set the parser if the default parser does not fit your needs.


Setup log shipper - docker2humio
--------------------------------

To run the shipper image set the env. variables: HUMIO_HOST, HUMIO_TOKEN, and HUMIO_DATASPACE.

Example
```
  $> docker run -p 24224:24224 -e HUMIO_HOST=https://cloud.humio.com:443 -e HUMIO_TOKEN=<INGEST_TOKEN> -e HUMIO_DATASPACE=<DATASPACE> pmech/docker2humio
```


Configure Application Containers
--------------------------------

To enable log shipping for a container just use the fluentd log-driver and set the parser with the env. log option, then the shipper container will do the rest.

Example
```
  $> docker run --log-driver=fluentd --log-opt env=parser -e parser=<HUMIO_PARSER> <YOUR_IMAGE>
```
