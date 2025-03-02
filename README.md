## JavDev Prototype Project

### Overview

A prototype to investigate zero install development environments for Java projects. 
Developers pull a complete container image, then build/run a new instance with copied 
JAR, EAR, or servlet and test away.  

This prototype includes a demo project as scaffolding for a Spring Framework(v6.1) based
web service with REST API endpoints.  This project depends on OpenJDK@21 for its runtime environment. 

### Build Run Containers

The Dockerfile expects one argument passed to the `build` command which would be the base image for 
the Java runtime environment.  If using the projects base image, the can be pulled from Docker Hub.

```declarative
docker pull ronwhite562/javdev-prototype:latest
BASE_IMAGE=ronwhite562/javdev-prototype:latest
docker build --build-arg BASE_IMAGE=${BASE_IMAGE} -t ${YOUR_IMAGE_NAME} .
```
This will create a new from ronwhite562/javdev-prototype that can now be run locally and without
any additional installed code, a "zero install" development environment.

### Modify the Greeting Demo Project

All files under `com.acme.restservice` can be removed or left intact for future reference. Either way
be sure to make any structural changes in the Dockerfile before build and running a new container instance.

This project assumes Gradle was used to compile the package and is configured to copy any JAR files
under the Gradle build/ directory.  However, Maven can be used as well. If Maven is the packager of
choice, be sure to comment out the Gradle ARG.

```declarative
// comment this line if using Maven
ARG GRADLE_BUILD=build/libs/*.jar
```

### Developers Beware

As a prototype project there will be alot of changes while in active development. If you clone this project, 
do not expect it be the same the next time you pull. Heck, it may not even be here!  
Outside that dire warning, clone away and have fun!  

RDW -









