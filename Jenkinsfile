pipeline {
    agent any

    tools {
        // Specify Maven tool installation
        maven 'Maven'
    }

    stages {
        stage('git checkout') {
            steps {
                // Checkout the repository
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/OpqTech/java-onlinebookstore.git']])
            }
        }
        
        stage('Build') {
            steps {
                // Build the Maven project
                sh "mvn clean package"
            }
        }
        
        stage('Deploy') {
            steps {
                // Deploy the WAR file to Tomcat
                deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://18.209.179.129:8080/')], contextPath: null, war: '**/*.war'
            }
            }
            }
            post {
        success {
            slackSend channel: '#jenkins', color: 'good', message: 'Successfully deployed online book store on Tomcat server', teamDomain: 'bhaskardevops', tokenCredentialId: 'slack-token'
        }
        failure {
            slackSend channel: '#jenkins', color: 'danger', message: 'Unsuccessful deployment. Please check the Tomcat URL.', teamDomain: 'bhaskardevops', tokenCredentialId: 'slack-token'
        }
        }
    }
