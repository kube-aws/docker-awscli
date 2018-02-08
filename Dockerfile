FROM alpine:3.7
MAINTAINER ykuoka@gmail.com

# groff and less are required by awscli: https://github.com/aws/aws-cli/issues/1957
RUN apk --no-cache --update add bash curl less groff jq python py-pip && \
  pip install --no-cache-dir --upgrade pip && \
  # See https://github.com/aws/aws-cli/releases for latest releases of awscli
  # See https://github.com/s3tools/s3cmd/releases for latest releases of s3cmd
  # See https://s3.amazonaws.com/cloudformation-examples/ for latest releases of aws-cfn-bootstrap(CloudFromation helper scripts)
  pip install --no-cache-dir awscli==1.14.34 s3cmd==2.0.1 https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-1.4-27.tar.gz && \
  mkdir /root/.aws && \
  aws --version && \
  s3cmd --version && \
  cfn-hup -h && \
  cfn-get-metadata -h

ENTRYPOINT []
