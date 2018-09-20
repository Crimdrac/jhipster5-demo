#!/usr/bin/env groovy

node {
    checkout scm

    stage('securitytest') {
       try {
            sh "securitytest/securitytest.sh"
            archiveArtifacts artifacts: '**/securitytest/*.html', fingerprint: true
        } catch(err) {
            throw err
        }
    }

}
