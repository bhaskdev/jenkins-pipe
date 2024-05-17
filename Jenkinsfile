pipeline {
    agent any

    tools {
        // Specify Maven tool installation
        maven 'Maven3'
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
                deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://3.86.230.7:8080/')], contextPath: null, war: '**/*.war'
            }
                
            }
            }
            post {
        success {
            slackSend channel: '#jenkins', color: 'good', message: 'Successfully deployed online book store into Tomcat server', notifyCommitters: true, teamDomain: 'bhaskardevops', tokenCredentialId: 'bhaskardevops'
        }
        failure {
            slackSend channel: '#jenkins', color: 'danger', failOnError: true, message: 'Unsuccessful deployment. Please check the Tomcat URL.', notifyCommitters: true, teamDomain: 'bhaskardevops', tokenCredentialId: 'bhaskardevops'
        }
        }
    }
