build-image:
	docker build . -t ghcr.io/dinhnq-gihot/online-shop-backend:latest -f ./docker/Dockerfile

run-container:
	docker compose -f ./docker/docker-compose.yaml up -d

down-container:
	docker compose -f ./docker/docker-compose.yaml down