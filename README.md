# react-and-spring-data-rest
## Overview
The application has a react frontend and a Spring Boot Rest API, packaged as a single module Maven application. You can build the application using maven and run it as a Spring Boot application using the flat jar generated in target (`java -jar target/*.jar`).

## Docker
A `Dockerfile` in the root directory is used to build the docker image of the app
   ```bash
   docker build --no-cache . -t spring-boot-react-example:latest
   ```
   
## Helm
The directory `spring-boot-react-example` consists of a Helm chart that can be used to deploy the app in a k8s cluster.
   ```bash
   helm package spring-boot-react-example/
   helm push spring-boot-react-example-0.1.0.tgz oci://<your-helm-charts-repository>
   helm upgrade --install spring-boot-react-example oci://<your-helm-charts-repository>/spring-boot-react-example -f <your-values-file>.yaml
   ```
   
## Jenkins
A `Jenkinsfile` in the root directory is used by a Jenkins server to build and push the docker image of the app using a `kaniko` image builder spawned inside k8s using `jenkins-pod-agent.yaml` 