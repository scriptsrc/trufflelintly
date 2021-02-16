FROM python:3-alpine
RUN apk add --no-cache git && pip install gitdb2==3.0.0 trufflehog ttam-lintly
# RUN adduser -S truffleHog
# USER truffleHog
WORKDIR /proj
ENTRYPOINT [ "entrypoint.sh" ]