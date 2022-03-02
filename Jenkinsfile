pipeline {
 
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/Nimerlin/devops-project1.git', branch: 'main', credentialsId: 'token_api_for_cicd'])
        }
      }
     }
   stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    }
    
    
