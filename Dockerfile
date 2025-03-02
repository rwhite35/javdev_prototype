# Docker 27.5.2, OpenJDK@17
# BASE_IMAGE is java JRE container
# use --build-arg=$BASE_IMAGE to pass in the value
# will overrides the default image.
ARG BASE_IMAGE="nginx:latest"
FROM ${BASE_IMAGE}

# TODO env configured in future release
ARG APP_ENV="dev"
ARG BUILD_SYS="gradle"
# both mvn & gradle prefix <rootProject.name>-0.0.1-SNAPSHOT.jar
ARG GRADLE_BUILD=build/libs/*.jar
ARG JAR_PATH=target/*.jar
#
# RUN if [ "$BUILD_SYS" = "gradle" ]; then JAR_PATH=${GRADLE_BUILD}; fi
COPY ${GRADLE_BUILD} app.jar

# command on on entry
ENTRYPOINT ["java","-jar","/app.jar"]
