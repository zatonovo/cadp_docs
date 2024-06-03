PACKAGE = $(shell pwd | xargs basename)
APP_DIR = zeomancer
REPOSITORY = $(PACKAGE)
VERSION ?= 1.0.0
IMAGE ?= $(REPOSITORY):$(VERSION)


ifdef DISPLAY
	#XAUTH := /home/$(shell whoami)/.Xauthority
	#XVARS := --network=host -e DISPLAY=$(DISPLAY) -v $(XAUTH):/root/.Xauthority
	XSOCK := /tmp/.X11-unix
	XAUTH := /tmp/.docker.xauth
	XVARS := -e DISPLAY=$(DISPLAY) -v $(XSOCK):$(XSOCK) -v $(XAUTH):$(XAUTH) -e XAUTHORITY=$(XAUTH)
endif

ifdef MODULE
  PYCMD := -m $(MODULE)
endif

HOST_DIR := $(shell pwd)
MOUNT_HOSTDIR := -v $(HOST_DIR):/app/$(APP_DIR)

CONTAINER_ID = $(shell docker ps | grep '$(REPOSITORY)' | awk '{print $$1}')

.PHONY: all config_xauth run test clean build bash bash_ r python
config_xauth:
	@echo "Set up Xauth to forward display"
	xauth nlist $(DISPLAY) | sed -e 's/^..../ffff/' | xauth -f $(XAUTH) nmerge -

build:
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(REPOSITORY):latest

docs:
	docker run --rm $(XMOUNT) $(MOUNT_HOSTDIR) $(REPOSITORY)
