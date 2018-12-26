pipeline {
    agent any
        parameters {
            string(
                name: 'Path',
                defaultValue:"sbt",
                description: "which project to create CI|CD ")
    }
    stages {
        stage("build") {
            steps {
                script {
                    if ("${params.Path}" == "sbt")
                     {
                         sh "/scripts/sbt.sh"
                         print "fdsfds"
                }
                else{
                    print "maven project"
                }
                    
                }
            }
        }
    }
}