pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/FikyAnggra/karate-api']]])
                discordSend description: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", footer: "STARTED", result: "SUCCESS", title: "Jenkins Status", webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb"

           }
        }
        stage('Test') {
            steps {
                bat 'mvn test -Dtest=TestRunnerProearn'
                discordSend description: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", footer: "${currentBuild.currentResult}",  result: currentBuild.currentResult, title: "Jenskins Status", webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb"
            }
        }
//         stage('Push') {
//             steps {
//                 git push origin master
//             }
//         }
    }
    post {
        always {
            script {
                    def resulthtml = readFile('target/karate-reports/karate-summary-json.txt').toString()
                    def json = new groovy.json.JsonSlurperClassic().parseText(resulthtml)
                    def featuresPassed = json.featuresPassed
                    def featuresFailed = json.featuresFailed
                    def totalTime = json.totalTime
                    def featuresSkipped = json.featuresSkipped
                    def resultDate = json.resultDate
                    def scenariosPassed = json.scenariosPassed
                    def scenariosFailed = json.scenariosfailed

                    def messageAllFeature =
                                """
                                Result Automation Karate API NOBI\n

                                Running Date        = ${resultDate}
                                Total Running Time  = ${totalTime} m/s
                                Feature Passed      = ${featuresPassed}
                                Feature Skipped     = ${featuresSkipped}
                                Feature Failed      = ${featuresFailed}
                                Scenario Passed     = ${scenariosPassed}
                                Scenario Failed     = ${scenariosFailed}
                                """
                    discordSend description: "${messageAllFeature}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb#jenkins-summary#1107549132945641553"

                    def featureSummary = json.featureSummary
                    for (int i = 0; i < featureSummary.size(); i++) {
                        def durationMillis = json.featureSummary.durationMillis[i]
                        def name = json.featureSummary.name[i]
                        def scenarioCount = json.featureSummary.scenarioCount[i]
                        def passedCount = json.featureSummary.passedCount[i]
                        def failedCount = json.featureSummary.failedCount[i]
                        def failed = json.featureSummary.failed[i]
                        def packageQualifiedName = json.featureSummary.packageQualifiedName[i]
                        def messageScenario =
                                """
                                ==================================
                                Automation Karate API
                                Feature Summary
                                ==================================
                                Feature Name        = ${name}
                                Running Time        = ${durationMillis} m/s
                                Total Scenario      = ${scenarioCount}
                                Scenario Passed     = ${passedCount}
                                Scenario Failed     = ${failedCount}
                                ==================================
                                """
                        if (failed == true) {
                            discordSend description: "${messageScenario}", footer: "FAILURE", link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html", result: "FAILURE", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb#1107549132945641553"
                        } else {
                            discordSend description: "${messageScenario}", footer: "SUCCESS", link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html", result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb#jenkins-success/1107547897408524338"
                        }

                    }
            }
        }
    }
}
