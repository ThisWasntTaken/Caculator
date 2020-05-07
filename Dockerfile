FROM maven:3.6.3-jdk-11

WORKDIR /build
COPY pom.xml .
COPY src/ /build/src/
RUN mvn install

COPY /build/target/Calculator-1.0-SNAPSHOT.jar /app/my-app.jar
CMD java -cp /app/my-app.jar com/calculator/Calculator