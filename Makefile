build:
	@docker-compose -p jenkins build
build-clean:
	@docker-compose -p jenkins build --no-cache
start:
	@docker stack deploy --compose-file docker-compose.yml jenkins
stop:
	@docker stack rm jenkins
status:
	@echo 'Stacks:'
	@docker stack ls
	@echo ''
	@echo 'Services:'
	@docker service ls
	@echo ''
	@echo 'Containers:'
	@docker ps -a
test-master:
	@docker run --rm -it --name jenkins-master-test jenkins-master /bin/ash
test-slave:
	@docker run --rm -it --name jenkins-slave-test jenkins-slave /bin/ash
