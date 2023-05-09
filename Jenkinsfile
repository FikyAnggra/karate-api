pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/FikyAnggra/karate-api']]])

           }
        }
        stage('Test') {
            steps {
                bat 'mvn test -Dtest=TestRunnerProearn'
            }
        }
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
                    discordSend description: "${messageAllFeature}", footer: "${currentBuild.currentResult}", link: "$BUILD_URL", result: currentBuild.currentResult, title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1105458981620682925/FuYrySqFHZNWFq87vUe8TF__5WSK5ECDQIY_Z63MDMzDuZixzUOeSCHejdXFAlLS1Pd9"

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
//                         if (failed == true) {
//                             discordSend description: "${messageScenario}", footer: "FAILURE", link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html", result: "FAILURE", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1075243688457949226/jql77_Fnr25n_7x7o91AP0sZPe48bb35WM-ypvb42fyl3QlDjL4UFu9y6w0kXLRIdUsh"
//                         } else {
//                             discordSend description: "${messageScenario}", footer: "SUCCESS", link: "http://localhost:8888/job/automation-karate-api/${env.BUILD_NUMBER}/execution/node/3/ws/target/karate-reports/${packageQualifiedName}.html", result: "SUCCESS", title: "Jenkins Pipeline Build ${env.BUILD_NUMBER}", webhookURL: "https://discord.com/api/webhooks/1075243688457949226/jql77_Fnr25n_7x7o91AP0sZPe48bb35WM-ypvb42fyl3QlDjL4UFu9y6w0kXLRIdUsh"
//                         }

                    }
            }
        }
    }
}
