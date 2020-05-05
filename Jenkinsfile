pipeline {
  agent {
    docker {
      image 'maven:3.6.3-jdk-11'
      image 'openjdk:11-jre'
    }
  }
  stages {
    stage('Build') {
      steps {
        sh 'mvn -B -DskipTests clean package'
      }
    }
    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }
  }
}