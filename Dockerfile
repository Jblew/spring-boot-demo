FROM openjdk:8-jdk-slim-stretch
  
WORKDIR "/buildroot"
COPY ./src/ /buildroot/src/
COPY ./gradle /buildroot/gradle/
COPY ./build.gradle /buildroot/build.gradle
COPY ./gradlew /buildroot/gradlew
COPY ./settings.gradle /buildroot/settings.gradle

EXPOSE 8080
ENV GRADLE_OPTS "-Xmx512m -Djava.security.egd=file:/dev/./urandom -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"
ENV DEFAULT_JVM_OPTS "-Xmx512m -Djava.security.egd=file:/dev/./urandom -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"

CMD ["./gradlew", "--gradle-user-home", "/gradlehome", "clean", "run"]
