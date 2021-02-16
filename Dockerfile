FROM python:3-alpine
RUN apk add --no-cache git && pip install gitdb2==3.0.0 trufflehog ttam-lintly
# RUN adduser -S truffleHog
# USER truffleHog
ADD entrypoint.sh /entrypoint.sh
WORKDIR /proj
ENTRYPOINT [ "/entrypoint.sh" ]