SHELL = /bin/sh

APP_NAME ?= algolia
VERSION ?= $(shell git rev-parse --short HEAD)
AUTHOR ?= $(shell git log --pretty=format:'%an' -n 1)

PACKAGES ?= ./...
APP_PACKAGES = $(shell go list -e $(PACKAGES) | grep -v vendor | grep -v node_modules)

GOBIN=bin
BINARY_PATH=$(GOBIN)/$(APP_NAME)

help: Makefile
	@sed -n 's|^##||p' $< | column -t -s ':' | sed -e 's|^| |'

## $(APP_NAME): Build app with dependencies download
$(APP_NAME): deps go

## go: Build app
go: format lint build

## name: Output name of app
name:
	@echo -n $(APP_NAME)

## dist: Output build output path
dist:
	@echo -n $(BINARY_PATH)

## version: Output sha1 of last commit
version:
	@echo -n $(VERSION)

## author: Output author's name of last commit
author:
	@python -c 'import sys; import urllib; sys.stdout.write(urllib.quote_plus(sys.argv[1]))' "$(AUTHOR)"

## deps: Download dependencies
deps:
	go get github.com/golang/dep/cmd/dep
	go get github.com/kisielk/errcheck
	go get golang.org/x/lint/golint
	go get golang.org/x/tools/cmd/goimports
	dep ensure

## format: Format code of app
format:
	goimports -w **/*.go
	gofmt -s -w **/*.go

## lint: Lint code of app
lint:
	golint $(APP_PACKAGES)
	errcheck -ignoretests $(APP_PACKAGES)
	go vet $(APP_PACKAGES)

## build: Build binary of app
build:
	CGO_ENABLED=0 go build -ldflags="-s -w" -installsuffix nocgo -o $(BINARY_PATH) cmd/algolia.go

.PHONY: help $(APP_NAME) go name dist version author deps format lint tst bench build
