pipeline {
    agent any
    tools {
  maven 'Maven'
}

   stages {
        stage('Git checkout') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/bhaskdev/jenkins-pipe.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
    }
}
