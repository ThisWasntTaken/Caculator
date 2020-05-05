# Step : Test and package
FROM maven:3.6.3-jdk-11 as builder

RUN apt-get install -y openssh-server
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN service ssh restart
RUN ssh-keygen -N '' -f ~/.ssh/id_rsa
RUN cat /etc/hosts

WORKDIR /build
COPY pom.xml .
COPY src/ /build/src/
RUN mvn install

# Step : Package image
FROM openjdk:11-jre

COPY --from=builder /build/target/Calculator-1.0-SNAPSHOT.jar /app/my-app.jar
CMD java -cp /app/my-app.jar com/calculator/Calculator
ENTRYPOINT service ssh restart && bash