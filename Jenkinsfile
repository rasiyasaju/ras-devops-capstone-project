pipeline {

    agent any

    stages {

        stage('Build') {

            steps {

                echo "Building Application"

                sh '''
                docker build -t website:${BUILD_NUMBER} .
                '''
            }
        }

        stage('Test') {

            steps {

                echo "Testing Application"

                sh '''
                docker run --name testcontainer -d \
                website:${BUILD_NUMBER}

                sleep 10

                docker ps

                docker rm -f testcontainer
                '''
            }
        }

        stage('Production') {

            when {
                branch 'master'
            }

            steps {

                echo "Deploying to Production"

                sh '''
                docker stop prodcontainer || true
                docker rm prodcontainer || true

                docker run -d \
                --name prodcontainer \
                -p 80:80 \
                website:${BUILD_NUMBER}
                '''
            }
        }
    }
}
