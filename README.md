# Deployment 5!

In this deployment I will be building a CI/CD pipeline on Jenkins server to deploy a containerized application using Jenkins Agents. I will containerize the url-shortener application using Dockerfile and Docker Compose before being uploaded as an image to Docker Hub. Then I will deploy the app and AWS resources  using Terraform configuration files.
-----------------------------------------------------------------------------------------------------------
## Goals
* Ceate an three EC2 instance.
* The first EC2 install and set up jenkins server.
* The second EC2 install and set up terraform.
* The third EC2 install and set up docker.
* Set up jenkins agents for docker.
* Set up jenkins agents for terraform.
* Create credentials.
* Create Jenkinsfile.
* Create a pipeline on Jenkins.


## Process
* #### Creation of the three EC2!
![Screenshot Capture - 2022-11-30 - 20-01-17](https://user-images.githubusercontent.com/108818957/204941932-5dc23ebe-0fab-4bd2-81e2-e267ea11b270.png)

* #### Check to see if Docker, Jenkins & Terraform was properly installed in each EC2
Jenkins check!

![Screenshot Capture - 2022-11-30 - 20-46-45](https://user-images.githubusercontent.com/108818957/204946656-11ead39d-0932-4bcb-93ca-317ee63212d4.png)

Terraform check!

![Screenshot Capture - 2022-11-30 - 20-40-13](https://user-images.githubusercontent.com/108818957/204945824-2abfec09-2d3f-4d84-a503-804edd0974dc.png)

Docker check!

![Screenshot Capture - 2022-11-30 - 20-35-07](https://user-images.githubusercontent.com/108818957/204945698-aa66f90f-46c0-48bb-abf6-423e4da82408.png)

* #### Create credentials!
  * Set up jenkins agents for docker and terraform.
  * Create AWS_ACCESS_KEY and AWS_SECRET_KEY.
  * Create a new access token on github.
  * Create a new dockerhub access token.
![Screenshot Capture - 2022-11-30 - 21-14-37](https://user-images.githubusercontent.com/108818957/204951867-30dfa1d3-7c08-4e12-bbac-b0dcd5a4ed42.png)

* #### Create Jenkinsfile.
  * The build stage - The application will be created in a virtual environment.
  * The test stage - The application will run unit tests to make sure it's working as expected.
  * Create Container stage - The dockerfile will be copied from the repository to create an image of the flask application.
  * Push to DockerHub stage - The image will be push to dockerHub to later be used in terraform.
  * Deploy to ECS stage - Terraform will create the infrastructure need on aws and ECS will use the image from dockerhub.
  * Destroy ECS Infra - Terraform will destory all the infrastructure created on aws to avoid unexpected charges. 

* #### ERRORS!!!
  * My first error occurred during the test stage, this was due to an error in my [test_app.py](https://github.com/finalboss360/kuralabs_deployment_5/blob/main/test_app.py).
![Screenshot Capture - 2022-11-22 - 17-47-06](https://user-images.githubusercontent.com/108818957/204956497-69edc1ea-a570-4d5c-b581-a3c68d73da4b.png)
  * My second error occurred in my [Jenkinsfile]( https://github.com/finalboss360/kuralabs_deployment_5/blob/main/Jenkinsfile) more especially the deploy to ECS stage. Jenkins was access my previous credentials from last build, which caused my build to fail. Luckily, I was able to figure this out after my 26th attempt :-)
  ![Screenshot Capture - 2022-11-30 - 20-56-15](https://user-images.githubusercontent.com/108818957/204960999-63b90929-5f8d-4120-9ada-c422bf0195a8.png)
  * My third error occurred at the end of my build, I was unable to reach my url because I had port 5000 open instead of port 8000 in my [Terraform](https://github.com/finalboss360/kuralabs_deployment_5/tree/main/intTerraform)
![Screenshot Capture - 2022-11-29 - 14-35-32](https://user-images.githubusercontent.com/108818957/204958846-4f8f261e-a8d2-45f0-9dd0-f762e700e58e.png)

* #### Completed build with url-shortner!
  * ![Screenshot Capture - 2022-11-30 - 20-55-20](https://user-images.githubusercontent.com/108818957/204961899-364c38a5-13cb-46eb-9062-b62d5fa85c5f.png)
  * ![Screenshot Capture - 2022-11-29 - 15-36-22](https://user-images.githubusercontent.com/108818957/204961985-122bac98-1857-41aa-b1e9-22b43189ce22.png)
  
* ### Diagram!
  ![Diagram](https://user-images.githubusercontent.com/108818957/204962337-b2ec2536-e9c9-4f10-96ec-fd05858e7d1b.png)


