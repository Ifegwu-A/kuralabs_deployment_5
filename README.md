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
* Create a pipeline on Jenkins.
* Create Jenkinsfile.

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






