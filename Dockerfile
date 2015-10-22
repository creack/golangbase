FROM       golang:1.5

# Install Godep, golint and goimports.
RUN        go get github.com/tools/godep
RUN        go get github.com/golang/lint/golint
RUN        go get golang.org/x/tools/cmd/goimports

# Disable CGO and recompile the stdlib.
ENV        CGO_ENABLED 0
RUN        go install -a std

# Install jq.
RUN        apt-get update && apt-get install -y jq

MAINTAINER Guillaume J. Charmes <guillaume@charmes.net>
