pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh 'sudo docker build -t imagejob1 .'
            }
        }

        stage('Test') {
            steps {
                sh '''
                sudo docker rm -f testcontainer || true

                sudo docker run -d \
                --name testcontainer \
                -p 8085:80 imagejob1

                sleep 10

                curl -f http://localhost:8085

                sudo docker rm -f testcontainer
                '''
            }
        }

        stage('Deploy') {
            when {
                branch 'master'
            }

            steps {
                sh '''
                sudo docker rm -f c1 || true

                sudo docker run -d \
                --name c1 \
                -p 85:80 imagejob1
                '''
            }
        }
    }
}