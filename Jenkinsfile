pipeline {
	agent any
	tools {
		nodejs 'NodeJS'
	}

	stages {
		stage('Checkout Github'){
			steps {
				git branch: 'main', credentialsId: 'Git-tk', url: 'https://github.com/max-az-10/NodeApp.git'
			}
		}		

		stage('Install node dependencies'){
			steps {
				sh 'npm install'
			}
		}

		stage('Test Code'){
			steps {
				sh 'npm test'
			}
		}

                 stage('Build Docker Image'){
                        steps {
                                script {
                                        docker.build("nodeimage"+"build_number")
                                }
                        }
                }

        }

	post {
		success {
			echo 'Build&Deploy completed succesfully!'
		}

		failure {
			echo 'Build&Deploy failed. Check logs.'
		}
	}

}
