node {
   
   def BRANCH = 'master'
   def APPWORKSPACE = 'TechCrunchNews.xcworkspace'
    
    
    stage('Checkout') {
        
        // Checkout files.
        checkout([
            $class: 'GitSCM',
            branches: [[name: "${BRANCH}"]],
            doGenerateSubmoduleConfigurations: false,
            extensions: [], submoduleCfg: [],
            userRemoteConfigs: [[
                name: 'github',
                url: 'https://github.com/abhishekbedi1432/TechCrunchNews.git'
            ]]
        ])
    }
    
    stage('Installing dependencies') {
        sh '/usr/local/bin/pod install --verbose'
    }
    
    stage('Clean build') {
        sh 'xcodebuild clean "build" -workspace "TechCrunchNews.xcworkspace" -scheme "TechCrunchNews" -configuration "Debug" -destination "platform=iOS Simulator,name=iPhone 6,OS=12.1" '
    }
    
    stage('Analyze') {
        sh 'xcodebuild analyze build -workspace "TechCrunchNews.xcworkspace" -scheme "TechCrunchNews" -configuration "Debug" -destination "platform=iOS Simulator,name=iPhone 6,OS=12.1"'
    }
    
        stage('Test Target - Build For Testing') {
           // sh 'xcodebuild clean build -workspace "TechCrunchNews.xcworkspace" -scheme "TechCrunchNews" -configuration "Debug" -destination "platform=iOS Simulator,name=iPhone 6,OS=12.1"'
           sh 'xcodebuild build-for-testing -workspace "TechCrunchNews.xcworkspace" -scheme "TechCrunchNews" -sdk "iphonesimulator12.1" -destination "OS=12.1,name=iPhone 6" -configuration Debug -enableCodeCoverage YES -derivedDataPath "build"'
        }
   
        stage('Test Target - Running Tests') {
           sh 'xcodebuild test-without-building -xctestrun "build/Build/Products/TechCrunchNews_iphonesimulator12.1-x86_64.xctestrun" -destination "OS=12.1,name=iPhone 6" -enableCodeCoverage YES  | /usr/local/bin/xcpretty -r junit'
        }
   
        stage('Publish Test Results') {
           // Publish test restults.
           step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
        }
}

