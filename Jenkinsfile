pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                    sh '''#!/bin/bash
                    python3 -m venv test3
                    source test3/bin/activate
                    pip install pip --upgrade
                    pip install -r requirements.txt
                    export FLASK_APP=application
                    flask run &
                    '''
                }
            }
        
        stage ('Test') {
            steps {
                    sh '''#!/bin/bash
                    source test3/bin/activate
                    py.test --verbose --junit-xml test-reports/results.xml
                    '''
                }
            }

        stage ('Create Container') {
            agent { label 'DockerDeploy' }
            steps {
                sh 'sudo docker build -t myshortner:v1.0 .'
            }
        }
        stage ('Push to DockerHub') {
            agent { label 'DockerDeploy' }
            steps {
                sh '''#!/bin/bash
                echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                sudo docker tag docker tag myshortner:v1.0 finalboss360/urlshortner:latest
                sudo docker push finalboss360/urlshortner:latest
                docker logout
                '''
            }
        }
        stage ('Deploy to ECS') {
            agent { label 'terraformagent' }
            steps {
                withCredentials([string(credentialsId: 'AWS_ACCESS_KEY', variable: 'aws_access_key'),
                string(credentialsId: 'AWS_SECRET_KEY', variable: 'aws_secret_key')]) {
                    dir('intTerraform') {
                        sh ''' #!/bin/bash
                        terraform init
                        terraform plan -out plan.tfplan -var="aws_access_key=${aws_access_key}" -var="aws_secret_key=${aws_secret_key}"
                        terraform apply plan.tfplan
                        sleep 60
                        '''
                    }
                }
            }
        }
        stage ('Destroy ECS Infra') {
            agent { label 'terraformagent' }
            steps {
                withCredentials([string(credentialsId: 'AWS_ACCESS_KEY', variable: 'aws_access_key'),
                string(credentialsId: 'AWS_SECRET_KEY', variable: 'aws_secret_key')]) {
                    dir('intTerraform') {
                        sh 'terraform destroy --auto-approve -var="aws_access_key=$aws_access_key" -var="aws_secret_key=$aws_secret_key"'
                    }
                }
            }
        }
    }
}
