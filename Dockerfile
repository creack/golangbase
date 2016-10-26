FROM       golang:1.7

# Install Godep, golint and goimports.
RUN        go get github.com/tools/godep \
                  github.com/golang/lint/golint \
                  golang.org/x/tools/cmd/goimports \
                  github.com/axw/gocov/... \
                  github.com/AlekSi/gocov-xml \
                  github.com/jstemmer/go-junit-report \
                  github.com/matm/gocov-html \
                  github.com/alecthomas/gometalinter && gometalinter -i

# Disable CGO and recompile the stdlib.
ENV        CGO_ENABLED 0
RUN        go install -a std

# Install glide and jq.
RUN        curl https://glide.sh/get | sh && apt-get update && apt-get install -y jq

MAINTAINER Guillaume J. Charmes <guillaume@charmes.net>
