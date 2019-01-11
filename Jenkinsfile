node {
    environment {
        BRANCH = "master"
    }
   stage('Checkout') {
        
        // Checkout files.
        checkout([
            $class: 'GitSCM',
            branches: [[name: "master"]],
            doGenerateSubmoduleConfigurations: false,
            extensions: [], submoduleCfg: [],
            userRemoteConfigs: [[
                name: 'github',
                url: 'https://github.com/abhishekbedi1432/TechCrunchNews.git'
            ]]
        ])

        // Build and Test
        //sh 'xcodebuild -scheme "TechCrunchNews" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 6,OS=10.1" -enableCodeCoverage YES | /usr/local/bin/xcpretty -r junit'

        // Publish test restults.
       // step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
    }
    
    
    stage('Build') {

        // Build and Test
        // sh 'xcodebuild -scheme "TableViewWithMultipleCellTypes" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 6,OS=10.1" -enableCodeCoverage YES | /usr/local/bin/xcpretty -r junit'
        sh 'xcodebuild -scheme "TechCrunchNews" -configuration "Debug" build -destination "platform=iOS Simulator,name=iPhone 6,OS=10.1"'
        // Publish test restults.
       // step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
    }
    
       stage('Test') {

        //Test
         sh 'xcodebuild -scheme "TechCrunchNews" -configuration "Debug" test -destination "platform=iOS Simulator,name=iPhone 6,OS=10.1" -enableCodeCoverage YES | /usr/local/bin/xcpretty -r junit'
       // sh 'xcodebuild -scheme "TechCrunchNews" -configuration "Debug" build -destination "platform=iOS Simulator,name=iPhone 6,OS=10.1"'
        // Publish test restults.
       // step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
    }

}
