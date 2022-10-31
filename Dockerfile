FROM eclipse-temurin:11
RUN mkdir /opt/app
COPY build/libs/springbootk8sdemo2-0.0.1-SNAPSHOT.jar /opt/app
CMD ["java", "-jar", "/opt/app/springbootk8sdemo2-0.0.1-SNAPSHOT.jar"]