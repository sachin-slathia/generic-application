pipeline {
    agent any
    environment {
       PATH = "${env.WORKSPACE}/scripts/env.sh:$PATH"
       isContainerized = true
    }

    stages {
       stage('Checkout which Devops branch') {
         steps{
            echo "Which Devops branch to check in"
          script{
               echo "INSIDE SCRIPT FUNCTION"
               def current_branch = env.BRANCH_NAME
               def devOpsBranch = "master"
               def deployableBranch = true

                   switch (current_branch) {
                   case "develop":
                   devOpsBranch = "develop"
                   break
                   case "QA":
                   devOpsBranch = "QA"
                   break
                   case "master":
                   devOpsBranch = "master"
                   break
                   default:
                   deployableBranch = false
         }
               dir('Devops') {
                git url: "https://github.com/slathia15/generic-application-Devops",branch:"${current_branch}" 
    }  
     }
   }
  } 
       
       
       stage('Checkout source code') {
          steps{

              git url: "https://github.com/slathia15/generic-application"
                    
          }
         
    }    
        stage("build") {
            steps {
                script {
                           if (fileExists('build.sbt')) {
                           sh './Devops/scripts/sbt.sh'
                           archiveArtifacts artifacts: 'target/scala-2.11/assignment_2.11-1.0-SNAPSHOT-sans-externalized.jar'
                      } else if(fileExists('pom.xml') && !fileExists('build.sbt')){
                           sh './Devops/scripts/mvn.sh'
                          }
                       else {
                           echo "The repo does not contain build.sbt or pom.xml"
                       }   
                    
                }
            }
        }
        stage('Whether we want containerized Deployment or not')
         {
  	   when {
                 branch 'Develop'
               }
           steps{
              withCredentials([string(credentialsId: 'docker_login_password', variable: 'PASSWORD')]) {
               script{
                   if(isContainerized == "true"){
                       echo "Sachin"
                       def externalMethod = load("./Devops/groovy/build_docker_services.groovy")
                       echo "$externalMethod"
                       externalMethod.build("hub.docker.com","slathia15","${PASSWORD}","master")
                   }
                   else{
                     echo "Not in Deployment"
                   }
               }
           } 
         }
    }
  }
}
