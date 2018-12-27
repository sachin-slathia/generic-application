pipeline {
    agent any
    stages {
       stage('Checkout source code') {
       steps{    
        source env.sh  
        git url: $GIT_URL
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