pipeline {
    agent any
    stages {
       stage('Checkout source code') {
       steps{   
       script {
          git_a = sh(returnStdout: true, script: 'source ./scripts/env.sh')
        } 
        echo "${env.git_a}"
        git url: "${env.git_a}",credentialsId: "${env.CREDENTIAL_ID}"
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