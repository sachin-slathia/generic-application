pipeline {
    agent any
    stages {
       stage('Checkout source code') {
       steps{    
        sh './scripts/env.sh'  
        echo "${env.GIT_UR}"
        git url: "${env.GIT_UR}",credentialsId: "${env.CREDENTIAL_ID}"
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