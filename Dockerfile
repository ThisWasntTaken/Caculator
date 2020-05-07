FROM maven:3.6.3-jdk-11

WORKDIR /build
COPY pom.xml .
COPY src/ /build/src/
RUN mvn install

CMD java -cp /build/target/Calculator-1.0-SNAPSHOT.jar com/calculator/Calculator