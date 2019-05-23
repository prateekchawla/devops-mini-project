def elastic_ip
def GIT_COMMIT_EMAIL
pipeline {
    agent any
    environment {
       elastic_ip = sh(script: 'sudo cat /var/lib/jenkins/workspace/launch-job/elastic_ip.txt', , returnStdout: true).trim()
   }
    stages {  
             stage('Lunch Ec2') {                  
                    steps {
                        sh 'sudo chmod +x launch_ec2_instance.sh'
                        sh './launch_ec2_instance.sh'                    
                    }
             }
         
            stage('Copy required Scripts') {                  
                steps {
                        sh 'echo helloworld1'
                        sh 'echo ${elastic_ip}'
                        sh 'echo helloworld2'
                        sh 'scp -o StrictHostKeyChecking=no $WORKSPACE/install_docker.sh ubuntu@${elastic_ip}:/home/ubuntu/'
                        sh 'scp $WORKSPACE/install_docker_nginx.sh ubuntu@${elastic_ip}:/home/ubuntu/'
                        sh 'ssh ubuntu@${elastic_ip} sudo chmod +x install_docker.sh'
                        sh 'ssh ubuntu@${elastic_ip} sudo chmod +x install_docker_nginx.sh'
                   
                }
            }
            stage('Installed Docker & Nginx') {            
                steps {
                   
                        sh 'ssh ubuntu@${elastic_ip} ./install_docker.sh'
                        sh 'ssh ubuntu@${elastic_ip} ./install_docker_nginx.sh'
                    
                }
            }
            stage('Deploy Build') {            
                steps {
                    
                        sh 'scp $WORKSPACE/myapp/* ubuntu@${elastic_ip}:/home/ubuntu/myapp/'
                   
                }
            } 
           
                stage('Check Availability') {
                  steps {                         
                          sh 'curl -s --head  --request GET  http://${elastic_ip} | grep "200"'                          
                              
                       
                    }
                }
          
        

    }
}
