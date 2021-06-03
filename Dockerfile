FROM python:3.7-alpine

RUN pip install --quiet --no-cache-dir awscli


RUN apk update && apk add curl jq python3 py3-pip


ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
