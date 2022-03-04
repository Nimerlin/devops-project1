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
                sh "docker -H ssh://nitin@13.233.166.18 run -d -p 80:80 nimerlin/httpd"
 
            }
        }
}
}
