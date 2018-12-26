pipeline {
    agent any
        parameters {
            string(
                name: 'Tool',
                defaultValue:"sbt",
                description: "which project to create CI|CD ")
    }
    stages {
       stage('Checkout source code') {
       steps{      
        git url: 'https://github.com/slathia15/generic-application'
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