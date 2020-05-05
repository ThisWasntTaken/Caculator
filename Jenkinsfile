pipeline {
  // agent {
  //   docker {
  //     image 'maven:3.6.3-jdk-11'
  //     args '-v /root/.m2:/root/.m2' 
  //   }
  // }
  // stages {
  //   stage('Build') {
  //     steps {
  //       sh 'mvn -B -DskipTests clean package'
  //     }
  //   }
  //   stage('Test') {
  //     steps {
  //       sh 'mvn test'
  //     }
  //   }
  agent none
  stage('Deliver') {
    steps {
      sh 'docker build . -t calculator:1.0'
    }
  }
}