build:
	@docker build --file jenkins_master/Dockerfile --tag jenkins_master jenkins_master
	@docker build --file jenkins_slave/Dockerfile --tag jenkins_slave jenkins_slave
build-clean:
	@docker build --no-cache --file jenkins_master/Dockerfile --tag jenkins_master jenkins_master
	@docker build --no-cache --file jenkins_slave/Dockerfile --tag jenkins_slave jenkins_slave
start:
	@docker run --rm -d -p 80:8080 --name jenkins_master jenkins_master
stop:
	@docker stop jenkins_master
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
	@docker run --rm -it --name jenkins_master_test jenkins_master /bin/ash
test-slave:
	@docker run --rm -it --name jenkins_slave_test jenkins_slave /bin/ash
