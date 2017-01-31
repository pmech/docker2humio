
FROM fluent/fluentd:stable-onbuild
MAINTAINER Peter Mechlenborg <peter@humio.com>
LABEL Description="Docker 2 Humio custom fluentd shipper"

WORKDIR /home/fluen
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

USER root

RUN apk --no-cache add sudo build-base ruby-dev && \
    sudo -u fluent gem install fluent-plugin-elasticsearch && \
    sudo -u fluent gem install fluent-plugin-record-reformer && \
    sudo -u fluent gem install strptime && \
    rm -rf /home/fluent/.gem/ruby/2.3.0/cache/*.gem && sudo -u fluent gem sources -c && \
    apk del sudo build-base ruby-dev

EXPOSE 24224

USER fluent
CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
