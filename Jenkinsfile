pipeline {
	agent any
	stages {
		stage('Git Checkout'){
			steps {
				checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/iQuantC/Docker_NodeJS_Todo_App.git']])
			}
		}

	}

}
