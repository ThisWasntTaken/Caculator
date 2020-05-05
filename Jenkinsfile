pipeline {
  environment {
    registry = "ananthshreekumar/calculator"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent none
  stages {
    stage('Build and Test') {
      agent {
        docker {
          image 'maven:3.6.3-jdk-11'
          args '-v /root/.m2:/root/.m2' 
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
          post {
            always {
                junit 'target/surefire-reports/*.xml' 
            }
          }
        }
      }
    }
    stage('Deliver') {
      agent any
      stages {
        stage('Build Image') {
          steps{
            script {
              dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
          }
        }
        stage('Publish Image') {
          steps{
            script {
              docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
              }
            }
          }
        }
      }
    }
  }
}