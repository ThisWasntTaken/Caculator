pipeline {
  agent {
    docker {
      image 'maven:3.6.3-jdk-11'
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
    stage('Deliver') {
      steps {
        sh 'docker build . -t calculator:1.0'
      }
    }
  }
}