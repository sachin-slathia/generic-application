pipeline {
    agent any
    stages {
       stage('Checkout source code') {
       steps{    
        sh './scripts/env.sh  
        git url: ${env.GIT_URL}
    }
    }   
        stage("build") {
            steps {
                script {
                    if (fileExists('build.sbt')) {
                           sh './scripts/sbt.sh'
                      } else {
                        echo 'No'
                          }
                    
                }
            }
        }
    }
}