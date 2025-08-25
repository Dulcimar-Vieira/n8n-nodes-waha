.PHONY: clean build link start dev

build:
	npm run lint && npm run build

link:
	npm link

start:
	cd ~/.n8n/custom && npm link @devlikeapro/n8n-nodes-waha && n8n start

start-dev:
	cd ~/.n8n/custom && npm link @devlikeapro/n8n-nodes-waha && N8N_WAHA_MODE=dev n8n start

tests:
	npm run test

dev:
	make clean
	make tests
	make build
	make link
	make start

clean:
	rm -rf ./dist

up-swagger:
	wget -qO- https://waha.devlike.pro/swagger/openapi.json | jq '.' > ./nodes/WAHA/openapi/openapi.json
