pipeline
{
environment{
registry = "nimerlin/assign"
registryCredential = 'nitin-dockerhub'
dockerImage = ''
}
agent any
stages{
stage('Cloning our Git') {
steps {
git([url: 'https://github.com/Nimerlin/devops-project1.git', branch: 'main', credentialsId: 'token_api_for_cicd'])
}
}
stage('Building our image') {
steps{
script {
dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
}
stage('Deploy our image') {
steps{
script {
docker.withRegistry( '', registryCredential ){
dockerImage.push()
}
}
}
}
stage('Run Docker container on remote hosts') {
             
            steps {
              script {
                    docker.withRegistry( '', registryCredential ){
                    dockerImages.pull()
                   }
 
            }
        }
  stage('Remove Unused docker image') {
steps{
sh "docker rmi $imagename:$BUILD_NUMBER"
sh "docker rmi $imagename:latest"
}
}
  
}
}
