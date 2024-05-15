pipeline {
    agent any
    tools {
  maven 'Maven3'
}

   stages {
        stage('Git checkout') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/bhaskdev/jenkins-pipe.git'
            }
        }
        stage ('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage ('Deploy tomcat'){
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://54.83.181.153:8090')], contextPath: null, war: '**/*.war'
            }
        }
        
    }
}
