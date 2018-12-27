pipeline {
    agent any
    environment {
       PATH = "env.WORKSPACE/scripts/env.sh:$PATH"
    }
    stages {
       stage('Checkout source code') {
          steps{
              echo PATH
              sh 'printenv'
              echo env.GIT_UR
                    
          }
         
    }
         
        stage("build") {
            steps {
                script {
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
