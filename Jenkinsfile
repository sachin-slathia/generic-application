#!groovy

import hudson.*
import hudson.model.*

node('master') {
    def current_branch = env.BRANCH_NAME
    echo env.BRANCH_NAME
    def devOpsBranch = "master"
    def deployableBranch = true
    def forceNotPR = false // set to true during replay to treat this like its not a PR even if it is

    switch (current_branch) {
      case "Develop":
        devOpsBranch = "Develop"
        break
      case "Master":
        devOpsBranch = "Master"
        break
      case "QA": 
        devOpsBranch = "QA"
        break
      default:
        deployableBranch = false
    }

    stage('Checkout source code') {
      deleteDir()  
      checkout scm
      dir('devops') {
        git branch: devOpsBranch, url: 'https://github.com/slathia15/generic-application-Devops.git'
      }
    }

    def commitId = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'")

    def gitRef = sh(returnStdout: true, script: "git ls-remote --refs   | grep $commitId | grep pull | cut -f 2")
    def isPullRequest = gitRef =~ /(pull)/ && !forceNotPR

    if (!isPullRequest && !deployableBranch) {
      echo "ERROR, branch $current_branch is not supported for deployment"
      currentBuild.result = 'FAILURE'
      return
    }
}
