# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with the necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

 ## New 'Delivery Date' Feature

**Overview**<br />
The delivery date feature is a new functionality added to the company's internal application. This feature allows the addition of a new field in the delivery tracking software. Although the feature has been reverted for the time being, its functionality is documented here for potential future reimplementation.

**Purpose**<br />
The delivery date function is intended to improve delivery management within the company's internal application in terms of accuracy and efficiency. Delivery dates can be added to the tracking system to help users better plan and track order fulfilment, leading to improved customer satisfaction and operational effectiveness.

**Backend Integration**<br />
To store delivery dates for orders, a new column called delivery_date has been incorporated in the backend Azure SQL Database.

**Usage**<br />

*End Users*<br />

Adding a Delivery Date to an Order
1.	Navigate to the Add New Order page within the application.
1.	Fill in the necessary order details, including product information and customer details.
1.	Locate the "Delivery Date" field and select or enter the desired delivery date.
1.	Complete the order creation by pressing ‘Add Order’.<br />

Viewing Delivery Date for an Order
1.	Navigate to the Order List page within the application.
1.	Look for the "Delivery Date" field to view the scheduled delivery date for the order.

*Developers*<br />
Database Interaction<br />
When interacting with the backend database, developers should ensure that the delivery_date column is properly handled in SQL queries and data manipulation operations.<br />

**Conclusion**<br />
The delivery date feature enhances the company's internal application by allowing users to track and manage delivery dates for orders efficiently. By following the outlined guidelines, both end users and developers can leverage this functionality effectively to streamline order fulfilment processes and improve overall operational efficiency.


## Getting Started

### Prerequisites

For the application to successfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be met with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## New 'Delivery Date' Feature

**Overview**<br />
The delivery date feature is a new functionality added to the company's internal application. This feature allows the addition of a new field in the delivery tracking software. Although the feature has been reverted for the time being, its functionality is documented here for potential future reimplementation.

**Purpose**<br />
The delivery date function is intended to improve delivery management within the company's internal application in terms of accuracy and efficiency. Delivery dates can be added to the tracking system to help users better plan and track order fulfilment, leading to improved customer satisfaction and operational effectiveness.

**Backend Integration**<br />
To store delivery dates for orders, a new column called delivery_date has been incorporated in the backend Azure SQL Database.

**Usage**<br />

*End Users*<br />

Adding a Delivery Date to an Order
1.	Navigate to the Add New Order page within the application.
1.	Fill in the necessary order details, including product information and customer details.
1.	Locate the "Delivery Date" field and select or enter the desired delivery date.
1.	Complete the order creation by pressing ‘Add Order’.<br />

Viewing Delivery Date for an Order
1.	Navigate to the Order List page within the application.
1.	Look for the "Delivery Date" field to view the scheduled delivery date for the order.

*Developers*<br />

Database Interaction<br />
When interacting with the backend database, developers should ensure that the delivery_date column is properly handled in SQL queries and data manipulation operations.<br />

**Conclusion**<br />
The delivery date feature enhances the company's internal application by allowing users to track and manage delivery dates for orders efficiently. By following the outlined guidelines, both end users and developers can leverage this functionality effectively to streamline order fulfilment processes and improve overall operational efficiency.

## Containerization With Docker<br />
**Containerization Process**
1.	Start by creating a Dockerfile 
1.	Next choose an official Python runtime as the parent image. We'll utilise Python:3.8-slim for this application since it's a good choice for a Flask application.
1.	Then set the working directory. Use the WORKDIR instruction to set the working directory in the container. Set it to /app, a commonly used directory for web applications.
1.	Copy the application files. To copy the contents of your local directory into the container's /app directory, use the COPY instruction. This ensures the files and application code are available inside the container.
1.	Install system dependencies and the ODBC driver required for database connectivity. Also, update the package lists (apt-get update) and then install packages (apt-get install). Then download and add the Microsoft GPG key and repository for installing the MS SQL Server ODBC driver. Finally, clean up unnecessary files (apt-get purge, apt-get clean).
1.	Upgrade pip and setuptools to their latest versions using pip. To ensure that the latest versions of these tools are available for installing Python packages.
1.	 Now install the Python packages specified in your requirements.txt file. This file should contain all the packages necessary for running the application successfully.
1.	To make your Flask application accessible from outside the container, specify that port 5000 should be exposed.
1.	Use the CMD instruction to specify the command that runs the file that starts the Flask application when the container launches.

**Docker Commands**
1.	First build the Docker image by running the following command: *docker build -t {name of the image} .*
1.	Run a Docker container locally to ensure the application functions correctly within the containerised environment. Execute the following command: *docker run -p 5000:5000 {name of the image}*. This maps port 5000 from your local machine to the container, enabling access to the containerised application through the web browser at *http://127.0.0.1:5000*.
1.	Tag your Docker image with the relevant information. Specify the image name, version, and Docker Hub repository in the following format: *docker tag {name of the image} {docker-hub-username}/{image-name}:{tag}*
1.	Login into your Docker Hub account and use the docker push command to upload the Docker image to Docker Hub: *docker push {docker-hub-username}/{image-name}:{tag}*
1.	Log in to your Docker Hub account and confirm that your Docker image is listed within your repository. You can test pulling the image from Docker Hub to ensure that it's accessible.

**Docker Image Information**

Name: liban45/test-web-app

Tags: v1

## Defining Networking Services With IaC.
This documentation outlines the process of defining networking services using Infrastructure as Code (IaC) with Terraform. This is done to deploy a containerised application on a Kubernetes cluster (to ensure the application's scalability). The focus will be on provisioning Azure networking services for the Azure Kubernetes Service (AKS) cluster. We will detail the steps for defining and provisioning the networking module.

1. **Initialize your Terraform project** with the name *aks-terraform*. Organise the project into two modules: *networking-module* and *aks-cluster-module*.
1. **Define input variables**: inside the *networking-module* directory, create a *variables.tf* file to define input variables for the module. These variables include resource_group_name, location, and vnet_address_space.
1. **Define Networking Resources**: In the *networking-module* directory, create a *main.tf* file to define essential networking resources. These resources include Azure Resource Group, Virtual Network (VNet), Control Plane Subnet, Worker Node Subnet, and Network Security Group (NSG).
1. **Define NSG Inbound Rules**: Add rules to the Network Security Group (NSG) to allow traffic to kube-apiserver and SSH from your public IP address. These rules are crucial for the successful provisioning of the AKS cluster and ensuring its security.
1. **Define Output Variables**: Create an *outputs.tf* file to define output variables for the networking module. These variables include vnet_id, control_plane_subnet_id, worker_node_subnet_id, networking_resource_group_name, and aks_nsg_id.
1.**Initialize the Networking Module**: In the *networking-module* run the terraform initialization command. This initialises the networking module, making it ready for use within the main project.

__*Dependencies*__ ensure that resources are provisioned in the right order within the networking module. The Azure Resource Group (RG) is the parent resource,  whereas the Virtual Network (VNet) depends on the RG for deployment location. As both the Control Plane and Worker Node Subnets are sub-resources they depend on the VNet. The Network Security Group (NSG) relies on the RG for deployment location and implicitly on the creation of subnets within the VNet. The NSG's presence is a requirement for NSG Inbound Rules. These requirements guarantee consecutive provisioning, which is necessary for the AKS cluster's networking services to be configured correctly.

## Provisioning an Azure Kubernetes Service (AKS) cluster with IaC.

The process involves defining input and output variables, configuring Azure resources, and initialising the cluster module for use within the main project.<br />

**Define Input Variables**: 
1. Create *variables.tf* file in the cluster module directory. 
1. Define input variables for AKS cluster customisation, including name, location, DNS prefix, Kubernetes version, service principal ID and secret. 
1. Make sure to include the output variables from the networking module as the networking module plays an important role in establishing the networking resources for the AKS cluster. 
1. Ensure a unique Service Principal name is used to prevent permission conflicts.<br />

**Configure Azure Resources**:
1. Create *main.tf* file, use input variables to set up AKS cluster resources such as name, location, DNS prefix, and Kubernetes version.
1. Define default node pool settings, including node count, VM size, and auto-scaling parameters.
1. Specify service principal authentication details.<br />


**Define Output Variables**: Create *outputs.tf* file to define output variables storing cluster name, ID, and Kubernetes configuration file.<br />

**Initialize Cluster Module**: Navigate to the aks-cluster-module directory and initialize for use within the main project.<br />

Following these steps ensures automated provisioning of an AKS cluster using Terraform, promoting consistency and reproducibility in infrastructure deployment.


## Creating AKS Cluster With IaC

To efficiently provision an AKS cluster using Terraform and seamlessly integrate previously defined modules, follow the comprehensive steps outlined below:

### Authentication Setup
1. **Create Service Principal**: Begin by creating a Service Principal (a dedicated service account used by Terraform to interact with Azure resources securely).
2. **Define Input Variables**: In the `variables.tf` file, define input variables for the `client_id` and `client_secret`. These variables will store the credentials required for authenticating Terraform with Azure. Mark these variables as sensitive to prevent accidental exposure of sensitive information.

### Provider Configuration
1. **Create Main Configuration File**: In the `aks-terraform` directory, create a `main.tf` file.
2. **Azure Provider Block**: Within `main.tf`, define the Azure provider block to enable authentication with Azure using the service principal credentials variables created previously. Include the required provider configuration details such as `subscription_id` and `tenant_id`.

### Integration of Networking Module
1. **Include Networking Module**: Integrate the networking module into the main configuration file (`main.tf`).
2. **Define Input Variables**: Set the input variables required by the networking module:
   - `resource_group_name`: A descriptive name for the Azure Resource Group.
   - `location`: The Azure region where resources will be deployed.
   - `vnet_address_space`: The address space for the Virtual Network (VNet) in CIDR notation.

### Integration of Cluster Module
1. **Include Cluster Module**: Integrate the cluster module into the main configuration file.
2. **Define Input Variables**: Specify the input variables required by the cluster module:
   - `aks_cluster_name`: The desired name for the AKS cluster.
   - `cluster_location`: The Azure region where the AKS cluster will be created.
   - `dns_prefix`: The DNS prefix for the AKS cluster, used to create a unique DNS name.
   - `kubernetes_version`: The version of Kubernetes to be used for the AKS cluster.
   - `service_principal_client_id` and `service_principal_secret`: The credentials of the service principal used for AKS cluster authentication.
   - Use output variables from the networking module (`resource_group_name`, `vnet_id`, `control_plane_subnet_id`, `worker_node_subnet_id`, `aks_nsg_id`) as input variables for the cluster module.

### Terraform Initialization and Application
1. **Initialize Terraform Project**: Navigate to the main project directory and initialize the Terraform project.
2. **Apply Terraform Configuration**: Apply the Terraform configuration to initiate the creation of networking resources and the AKS cluster. Ensure to add the resultant state file to `.gitignore` to avoid exposing sensitive information.

### Retrieve Kubeconfig and Test Cluster
1. **Retrieve Kubeconfig**: After AKS cluster provisioning, retrieve the kubeconfig file to securely connect to the cluster.
2. **Test Cluster**: Connect to the newly created cluster using the kubeconfig file to verify successful provisioning and operational status.

By following these steps, you can effectively automate the provisioning of an AKS cluster with Terraform, ensuring reliability and consistency in infrastructure deployment.

## Kubernetes Deployment to AKS

### Deployment and Service Manifests
Deploy the containerised application to a Kubernetes cluster, using Deployment and Service manifests. These manifests are defined as follows:
- **Deployment Manifest**: Create a file named `application-manifest.yaml` to define the Deployment resource. Key configurations include:
  - `replicas`: Specifies the desired number of pods to run, ensuring scalability and high availability.
  - `selector`: Identifies the pods managed by the Deployment using labels.
  - `containers`: Defines the container image and exposes port 5000 for communication.
  - `strategy`: Implements Rolling Updates to ensure smooth application updates with minimal downtime.
- **Service Manifest**: Within the same `application-manifest.yaml`, define a Service to facilitate internal communication. Configurations include:
  - `selector`: Matches labels of pods created by the Deployment for efficient traffic routing.
  - `ports`: Specifies TCP protocol on port 80 for internal communication within the cluster, targeting port 5000 of the container.
  - `type`: Set to ClusterIP for internal service within the AKS cluster.

### Deployment Strategy
Rolling Updates is utilised as the deployment strategy for its benefits:
- **Gradual Replacement**: Old instances are replaced one at a time for a smooth transition.
- **Continuous Availability**: The application remains accessible to users throughout the update.
- **Controlled Rollout**: Operators can control the update rate and monitor progress.
- **Built-in Health Checks**: Kubernetes ensures new instances are healthy before proceeding with the update.

### Testing and Validation
After deployment, we validate the application's functionality and reliability through testing:
- **Verification**: Confirm the status and details of deployed pods and services.
- **Port Forwarding**: Initiate port forwarding to a local machine for efficient testing.
- **Local Access**: Access the application locally at http://127.0.0.1:5000.
- **Functional Testing**: Test all application features, such as the orders table and Add Order functionality.

### Distribution to Internal Users
To distribute the application company-wide, consider using Ingress. Ingress controllers allow you to manage more advance routing, domain-based access, and can be a powerful way to manage both internal and external traffic. However, setting up an Ingress involves provisioning a company domain, which can be a complex and costly process and so it is beyond the scope of this project.
On the other hand, if the application was customer-facing rather than for internal use, using a Load Balancer service would be the preferred choice. This setup is especially suitable when serving the application to a broader audience, such as a public website or a customer portal.


## CI/CD Pipeline Documentation

### Overview
This project repository is configured with a comprehensive CI/CD pipeline using Azure DevOps. The pipeline automates both the containerization and deployment process, ensuring that every new feature added to the project triggers the automatic build of an updated Docker image, its release to Docker Hub, and the deployment of the updated containers to the Kubernetes cluster hosted on Azure Kubernetes Service (AKS).

### Pipeline Configuration Tasks
The tasks completed to configure the pipeline are as follows:
1. **Creation of Azure DevOps Project**: A new Azure DevOps project was created to host the CI/CD pipeline.
2. **Source Control Configuration**: GitHub was selected as the source control system, and the application code hosted in this repository was linked to the Azure DevOps project.
3. **Integration with Docker Hub**: A service connection is established between Azure DevOps and Docker Hub, enabling seamless integration with the Docker Hub container registry.
4. **Build Pipeline**: The build pipeline is set up to automatically run on each push to the main branch of this repository. It utilizes a Docker task with the `buildandPush` command to build and push a Docker image to Docker Hub.
5. **Integration with AKS**: A service connection is configured between Azure DevOps and AKS to facilitate secure deployments and effective management of applications on the Kubernetes cluster.
6. **Release Pipeline**: The release pipeline incorporates the `Deploy to Kubernetes` task with the `deploy` kubectl command to deploy the application to the AKS cluster automatically. It is triggered after the successful completion of the build pipeline.
7. **Testing and Validation**: The functionality of the CI/CD pipeline was tested by monitoring pod status and testing application functionality post-deployment.
### Validation Steps
After configuring the CI/CD pipeline, the following validation steps were performed:
1. **Monitoring Pod Status**: The status of pods within the AKS cluster was monitored using the command `kubectl get pods` to confirm correct creation and deployment.
2. **Testing Functionality**: Port forwarding was initiated using `kubectl port-forward <pod-name> 5000:5000` to access the application running on AKS securely. The functionality of the application was tested to ensure it operates correctly post-deployment.

# Include screenshots to enhance clarity!!!!!!!!!!!!!!!!!!!!!!!

## Monitoring Strategy for AKS Cluster

Comprehensive monitoring strategies were implemented to ensure effective monitoring and alerting for the AKS cluster. Below are the details of the strategies:

### Metrics Explorer Charts

Several Metrics Explorer charts are used to monitor the AKS cluster:

1. **Average Node CPU Usage:**
   - This chart tracks the CPU usage of the AKS cluster's nodes.
   - Significance: Helps ensure efficient resource allocation and detect potential performance issues.
   - ![Screenshot](insert_screenshot_average_node_cpu_usage.png)

2. **Average Pod Count:**
   - Displays the average number of pods running in the AKS cluster.
   - Significance: Key metric for evaluating the cluster's capacity and workload distribution.
   - ![Screenshot](insert_screenshot_average_pod_count.png)

3. **Used Disk Percentage:**
   - Monitors disk usage to prevent storage-related issues.
   - Significance: Tracks how much disk space is being utilized.
   - ![Screenshot](insert_screenshot_used_disk_percentage.png)

4. **Bytes Read and Written per Second:**
   - Provides insights into data I/O rates.
   - Significance: Helps identify potential performance bottlenecks.
   - ![Screenshot](insert_screenshot_bytes_read_written.png)

### Log Analytics
Various logs are analysed through Log Analytics:

1. **Average Node CPU Usage Percentage per Minute**
   - Significance: Tracks the CPU usage percentage at the node level over time. Monitoring CPU usage at a granular level helps detect performance anomalies, identify resource-intensive workloads, and optimize resource allocation. High CPU usage may indicate workload spikes, inefficient resource utilization, or performance bottlenecks.

2. **Average Node Memory Usage Percentage per Minute**
   - Significance: Monitors the memory usage percentage at the node level over time. Tracking memory usage helps identify memory-intensive applications or workloads, detect memory leaks, and optimize memory allocation. High memory usage may lead to performance degradation, out-of-memory errors, or application crashes.

3. **Pods Counts with Phase**
   - Significance: Provides information on the pod count with different phases (e.g., pending, running, terminating). Monitoring pod lifecycle phases helps ensure the smooth operation of workloads, and identify stuck or pending pods. Anomalies in pod counts may indicate deployment failures, resource constraints, or scheduling issues.

4. **Find Warning Value in Container Logs**
   - Significance: Searches for `warning` values in container logs to proactively detect issues or errors within containers. Monitoring container logs helps identify application errors, runtime issues, or misconfigurations, enabling prompt troubleshooting and issue resolution. Detecting warning messages helps mitigate potential service disruptions, data corruption, or application failures.

5. **Monitoring Kubernetes Events**
   - Significance: Tracks Kubernetes events related to pod scheduling, scaling activities, and errors. Monitoring Kubernetes events provides insights into cluster operations, identifies infrastructure changes, and helps maintain cluster stability and reliability. Monitoring events helps detect and respond to pod failures, node issues, or configuration changes, ensuring continuous operation and optimal performance of the AKS cluster.

### Alarm Configurations
Alarm rules are provisioned to trigger alerts:

1. **Used Disk Percentage Alert:**
   - Triggers an alarm when the used disk percentage exceeds 90%.
   - Configuration: Checks every 5 minutes with a loopback period of 15 minutes.
   - Significance: Proactively detects and addresses potential disk issues.
    - Response: Investigate the root cause of high disk usage and consider scaling storage resources or optimizing data storage.
   
2. **CPU and Memory Usage Alerts:**
   - Alerts trigger when CPU or memory usage exceeds 80%.
   - Configuration: Ensures notification when critical resource levels are approached.
    - Response: Assess application resource demands and consider scaling resources or optimizing application performance.

By implementing these monitoring strategies and response procedures, the operational efficiency of the AKS cluster is maintained, ensuring smooth operation and prompt issue resolution.


## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
