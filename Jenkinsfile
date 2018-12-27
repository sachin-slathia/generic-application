pipeline {
    agent any
    environment {
       PATH = "${env.WORKSPACE}/scripts/env.sh:$PATH"
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
       
              echo "$devOpsBranch"
     }
   }
  } 
       
       stage('Checkout source code') {
          steps{
              echo PATH
              sh 'printenv'
              git url: "https://github.com/slathia15/mavenProject"
              echo env.GIT_UR
                    
          }
         
    }
         
        stage("build") {
            steps {
                script {
                git url: "https://github.com/slathia15/generic-application-Devops"
                    if (fileExists('build.sbt')) {
                           sh './scripts/sbt.sh'
                      } else if(fileExists('pom.xml') && !fileExists('build.sbt')){
                           sh './scripts/mvn.sh'
                          }
                       else {
                           echo "The repo does not contain build.sbt or pom.xml"
                       }   
                    
                }
            }
        }
    }
  }
