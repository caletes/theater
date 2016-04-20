BUILD_DIR := build
# use the rest as arguments
IMAGE := $(word 2,$(MAKECMDGOALS))
TAG := $(word 3,$(MAKECMDGOALS))
# ...and turn them into do-nothing targets
$(eval $(IMAGE):;@:)
$(eval $(TAG):;@:)

all:
	@BUILD_DIR=$(BUILD_DIR); \
	for IMAGE in */ ; do \
		IMAGE=$${IMAGE%/}; \
		if [ $$IMAGE != $$BUILD_DIR ]; then \
			make -s dockerfiles $$IMAGE; \
		fi; \
	done;

dockerfiles:
	@IMAGE=$(IMAGE); \
	if [ -z $$IMAGE ]; then \
		echo dockerfiles rule take one argument, \'image\'; exit 2; \
	fi; \
	if [ ! -d $$IMAGE ]; then \
		echo $$IMAGE folder doesn\'t exist; exit 2; \
	fi; \
	for DOCKERFILE_M4 in $$IMAGE/Dockerfile-*.m4 ; do \
		TAG=$${DOCKERFILE_M4%.*} ; \
		TAG=$${TAG#$$IMAGE/Dockerfile-$$IMAGE:} ; \
		make -s dockerfile $$IMAGE $$TAG; \
	done;


dockerfile:
	@BUILD_DIR=$(BUILD_DIR); \
	IMAGE=$(IMAGE); \
	TAG=$(TAG); \
	DOCKERFILE_M4=$$IMAGE/Dockerfile-$$IMAGE:$$TAG.m4; \
	if [ -z $$IMAGE -o -z $$TAG ]; then \
		echo dockerfile rule take two arguments, \'image\' and \'tag\'; exit 2; \
	fi; \
	if [ ! -f $$DOCKERFILE_M4 ]; then \
		echo $$DOCKERFILE_M4 file doesn\'t exist; exit 2; \
	fi; \
	IMAGE_DIR=./$$BUILD_DIR/$$IMAGE:$$TAG; \
	COPIED_FILES_DIR=$$IMAGE/copied-files; \
	if [ -d $$IMAGE_DIR ]; then \
		rm -rf $$IMAGE_DIR; \
	fi; \
	mkdir -p $$IMAGE_DIR; \
	if [ -d $$COPIED_FILES_DIR ]; then \
		cp -R $$COPIED_FILES_DIR $$IMAGE_DIR; \
	fi; \
	M4PATH=$$IMAGE:$$IMAGE/inc m4 $$DOCKERFILE_M4 > $$IMAGE_DIR/Dockerfile; \
