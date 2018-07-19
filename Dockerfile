FROM alpine:3.8
MAINTAINER ykuoka@gmail.com

# groff and less are required by awscli: https://github.com/aws/aws-cli/issues/1957
RUN apk --no-cache --update add bash curl less groff jq python py-pip zip && \
  pip install --no-cache-dir --upgrade pip && \
  # See https://github.com/aws/aws-cli/releases for latest releases of awscli
  # See https://github.com/s3tools/s3cmd/releases for latest releases of s3cmd
  # See https://s3.amazonaws.com/cloudformation-examples/ for latest releases of aws-cfn-bootstrap(CloudFromation helper scripts)
  pip install --no-cache-dir awscli==1.15.61 s3cmd==2.0.2 https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-1.4-30.tar.gz && \
  mkdir /root/.aws && \
  aws --version && \
  s3cmd --version && \
  cfn-hup -h && \
  cfn-get-metadata -h

ENTRYPOINT []
