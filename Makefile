
build:
	mkdir -p plugins
	docker build -t docker2humio .


# Run with: docker run --rm -p 24224:24224 --name docker2humio -e HUMIO_HOST=https://cloud.humio.com:443 -e HUMIO_TOKEN=<INGEST_TOKEN> -e HUMIO_DATASPACE=<DATASPACE> docker2humio
