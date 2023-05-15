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
                            discordSend (
                                description: "${messageScenario}",
                                footer: "FAILURE",
                                link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                                result: "FAILURE", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                                webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb",
                                channel : '1107548656619499571'
                            )

                        } else {
                            discordSend (
                                description: "channelId",
                                footer: "SUCCESS",
                                link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                                result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                                webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb",
                                channelId : 'jenkins-success'
                            )
                            discordSend (
                            description: "ChannelID",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb",
                            channelID : 'jenkins-success'
                            )

                            discordSend (
                                description: "channelId : 1107547897408524338",
                                footer: "SUCCESS",
                                link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                                result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                                webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb",
                                channelId : '1107547897408524338'
                            )
                            discordSend (
                            description: "channelID : 1107547897408524338",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb",
                            channelID : '1107547897408524338'
                            )

                            discordSend (
                            description: "thread : jenkins-success",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb",
                            thread : 'jenkins-success'
                            )

                            discordSend (
                            description: "threadId : jenkins-success",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb",
                            threadId : 'jenkins-success'
                            )


                            discordSend (
                            description: "thread : 1107547897408524338",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb",
                            thread : '1107547897408524338'
                            )

                            discordSend (
                            description: "threadId : 1107547897408524338",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb",
                            threadId : '1107547897408524338'
                            )


                            discordSend (
                            description: "threadID : jenkins-success",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb",
                            threadID : 'jenkins-success'
                            )

                            discordSend (
                            description: "threadID : 1107547897408524338",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb",
                            threadID : '1107547897408524338'
                            )



                            discordSend (
                            description: "webbook/1107547897408524338",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107547897408524338/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb"
                            )


                            discordSend (
                            description: "#1107548454009446400",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb#1107548454009446400"
                            )


                            discordSend (
                            description: "#jenkins-success",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb#jenkins-success"
                            )


                            discordSend (
                            description: "#jenkins-status#1107548454009446400",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb#jenkins-status#1107548454009446400"
                            )



                            discordSend (
                            description: "#jenkins-status#jenkins-success",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb#jenkins-status#jenkins-success"
                            )


                            discordSend (
                            description: "#jenkins-status/jenkins-success",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb#jenkins-status/jenkins-success"
                            )


                            discordSend (
                            description: "#jenkins-status/1107548454009446400",
                            footer: "SUCCESS",
                            link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html",
                            result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}",
                            webhookURL: "https://discord.com/api/webhooks/1107548454009446400/VbmtyPgxWZAgu-1kcV7ZMYYyNuC4svQ2Mbhew6Hh6RxFSfI-Hmgp79QEa2ta3UytlaFb#jenkins-status/1107548454009446400"
                            )
                        }

                    }
            }
        }
    }
}
