default: vet test build

.PHONY: build
build:
	go build -o bin/terraform-provider-postgresreplication

.PHONY: install
install:
	go build -o bin/terraform-provider-postgresreplication
	mv bin/terraform-provider-postgresreplication ~/.terraform.d/plugins/mastery.net/mastery/postgresreplication/0.8.0/darwin_amd64/terraform-provider-postgresreplication_v0.8.0

.PHONY: vet
vet:
	go vet ./...

.PHONY: test
test:
	cd dockercompose && docker-compose up wait_for
	go test -count 1 -v ./...
