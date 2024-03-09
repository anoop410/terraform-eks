pipeline{
    agent any
    environment{
        AWS_ACCESS_KEY_ID = credentials("aws_access_key_id")
        AWS_SECRET_ACCESS_KEY = credentials("aws_secrey_access_key")
        S3_BUCKET_NAME = 'terraform-state-anoop'
        FILE = 'terraform.tfvars'
        AWS_DEFAULT_REGION = "ap-south-2"
    }
    stages{
        stage("CHECKOUT SCM"){
            steps{
                script{
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/anoop410/terraform-eks.git']])
                }
            }
        }
        stage("terraform intialize"){
            steps{
                script{
                    dir('eks'){
                        sh"terraform init"
                    }
                }
            }
        }
        stage("terraform format"){
            steps{
                script{
                    dir('eks'){
                        sh"terraform fmt"
                    }
                }
            }
        }
        stage("terraform validate"){
            steps{
                script{
                    dir('eks'){
                        sh"terraform validate"
                    }
                }
            }
        }
        stage("terraform variables input"){
            steps{
                script{
                    dir('eks'){
                        sh """
                            aws s3 cp s3://terraform-state-anoop/variables/$FILE ./
                        """
                    }
                }
            }
        }
        stage("terraform plan review"){
            steps{
                script{
                    dir('eks'){
                        sh"terraform plan"
                    }
                }
            }
        }
        stage("terraform plan apply/destroy"){
            steps{
                script{
                    dir('eks'){
                        sh"terraform $action --auto-approve"
                    }
                }
            }
        }
        stage("terraform deploying on cluster"){
            steps{
                script{
                    dir('eks/configurationfiles'){
                        sh"aws eks update-kubeconfig --name <myclustername>"
                        sh" kubectl apply -f deployment.yml"
                        sh"kubectl apply -f service.yml"
                    }
                }
            }
        }
    }
}