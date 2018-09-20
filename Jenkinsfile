#!/usr/bin/env groovy

node {
    checkout scm

    stage('build') {
        sh "java -version"
        sh "chmod +x mvnw"
        sh "./mvnw clean"
        sh "./mvnw com.github.eirslett:frontend-maven-plugin:install-node-and-yarn -DnodeVersion=v8.11.3 -DyarnVersion=v1.6.0"
        sh "./mvnw com.github.eirslett:frontend-maven-plugin:yarn"
    }
    stage('backend tests') {
        try {
            sh "./mvnw test"
        } catch(err) {
            throw err
        } finally {
            junit '**/target/surefire-reports/TEST-*.xml'
        }
    }
     stage('frontend tests') {
        try {
            sh "./mvnw com.github.eirslett:frontend-maven-plugin:yarn -Dfrontend.yarn.arguments=test"
        } catch(err) {
            throw err
        } finally {
            // Jenkins pipeline cannot handle the jest report format
            // junit '**/target/test-results/jest/TESTS-*.xml'
        }
    }
    stage('package and deploy') {
        sh "./mvnw com.heroku.sdk:heroku-maven-plugin:2.0.5:deploy -DskipTests -Pprod -Dheroku.appName=crimdrac-jhipster-5-demo"
        archiveArtifacts artifacts: '**/target/*.war', fingerprint: true
    }

    stage('securitytest') {
       try {
            sh "securitytest/securitytest.sh"
            archiveArtifacts artifacts: '**/securitytest/*.html', fingerprint: true
        } catch(err) {
            throw err
        }
    }
}
