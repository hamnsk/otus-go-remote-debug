docker-build-debug:
	DOCKER_DEFAULT_PLATFORM=linux/arm64 docker build -f Dockerfile -t debug .

docker-run-debug:
	DOCKER_DEFAULT_PLATFORM=linux/arm64 docker-compose -f docker-compose.yml up -d --build --force-recreate --no-deps