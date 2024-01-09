pipeline {
    agent any

    parameters {
        // Define parameters that allow users to input the Docker image name and Git repository URL
        string(name: 'GIT_REPO', description: 'The Git repository URL containing the Dockerfile')
    }

    stages {
	
		stage('Pre-flight Check') {
            steps {
                script {
                    // Check if the GIT_REPO parameter is provided
                    if (!params.GIT_REPO) {
                        error "The GIT_REPO parameter is missing. Please provide the Git repository URL containing the app."
                    }
                }
            }
        }
		
		stage('Checkout code') {
            steps {
                // Checkout the code from the specified Git repository and branch

				script {
					// Create a new temporary directory
					def tempDir = "${WORKSPACE}/chart"
					sh "mkdir -p ${tempDir}"
		
					// Checkout the code into the temporary directory
					dir(tempDir) {
						git url: env.GIT_REPO
					}
				}
            }
        }
		
        stage('Deploy') {
            steps {
                script {
                    // Deploy the application using docker-compose
					sh "ls -l && docker compose -f ${env.WORKSPACE}/docker-compose.yaml up"
                }
            }
        }
    }

    post {
        always {
            // Optional: clean up
            cleanWs()
        }
    }
}