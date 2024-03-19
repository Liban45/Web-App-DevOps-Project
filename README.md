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

### Overview
The delivery date feature is a new functionality added to the company's internal application. This feature allows the addition of a new field in the delivery tracking software. Although the feature has been reverted for the time being, its functionality is documented here for potential future implementation.

### Purpose
The delivery date function is intended to improve delivery management within the company's internal application in terms of accuracy and efficiency. Delivery dates can be added to the tracking system to help users better plan and track order fulfilment, leading to improved customer satisfaction and operational effectiveness.

### Backend Integration
To store delivery dates for orders, a new column called delivery_date has been incorporated in the backend Azure SQL Database.

### Usage
#### End Users
*Adding a Delivery Date to an Order*
1.	Navigate to the Add New Order page within the application.
1.	Fill in the necessary order details, including product information and customer details.
1.	Locate the "Delivery Date" field and select or enter the desired delivery date.
1.	Complete the order creation by pressing ‘Add Order’.<br />

*Viewing Delivery Date for an Order*
1.	Navigate to the Order List page within the application.
1.	Look for the "Delivery Date" field to view the scheduled delivery date for the order.

#### Developers
*Database Interaction*<br />
When interacting with the backend database, developers should ensure that the delivery_date column is properly handled in SQL queries and data manipulation operations.<br />

### Conclusion
The delivery date feature enhances the company's internal application by allowing users to track and manage delivery dates for orders efficiently. By following the outlined guidelines, both end users and developers can leverage this functionality effectively to streamline order fulfilment processes and improve overall operational efficiency.

## Containerisation With Docker<br />
### Containerisation Process
1.	Initially, a `Dockerfile` was created, and then an official Python runtime was chosen as the parent image. `Python:3.8-slim` is utilised for this application since it's a good choice for a Flask application.
1.	Next the working directory was set to `/app` using the `WORKDIR` instruction, as it is a commonly used directory for web applications.
1.	The `COPY` instruction was then used to copy the contents of the local directory into the container's `/app` directory. This ensures the files and application code are available inside the container.
1.	Following on, the system dependencies and the ODBC driver required for database connectivity need to be installed. Furthermore, the package lists also have to be updated and installed using `apt-get update` followed by `apt-get install`. The Microsoft GPG key and repository have to then be downloaded and added to install the MS SQL Server ODBC driver. Finally, clean up unnecessary files `apt-get purge`, `apt-get clean`.
1.	Pip is then needed to upgrade pip and setuptools to their latest versions. To ensure that the latest versions of these tools are available for installing Python packages.
1.	 The Python packages specified in the `requirements.txt` file need to be installed next. This file should contain all the packages necessary for running the application successfully.
1.	To make the Flask application accessible from outside the container, `port 5000` should be exposed.
1.	Finally the `CMD` instruction is used to specify the command that runs the file, which then starts the Flask application when the container launches.

### Docker Commands
1.	Firstly the Docker image is built by running the following command: `docker build -t {name of the image} .`.
1.	Then, the Docker container was run locally to ensure the application functions correctly within the containerised environment. This is done using the following command: `docker run -p 5000:5000 {name of the image}`. This maps port 5000 from the local machine to the container, enabling access to the containerised application through the web browser at `http://127.0.0.1:5000`.
1.	Next the Docker image is tagged with the relevant information. Specifying the image name, version, and Docker Hub repository in the following format: `docker tag {name of the image} {docker-hub-username}/{image-name}:{tag}`
1.	Then the docker push command was used to upload the Docker image to Docker Hub: `docker push {docker-hub-username}/{image-name}:{tag}`
1.	Lastly, the Docker Hub account was used to confirm that the Docker image is listed within the repository. Then the accessibility was tested by pulling the image from Docker Hub.

### Docker Image Information

Name: liban45/test-web-app

Tags: latest

## Defining Networking Services With IaC.
This documentation outlines the process of defining networking services using Infrastructure as Code (IaC) with Terraform. This is done to deploy a containerised application on a Kubernetes cluster (to ensure the application's scalability). The focus will be on provisioning Azure networking services for the Azure Kubernetes Service (AKS) cluster. 

1. **Initialising the Terraform project** with the name `aks-terraform`. The project was organised into two modules: `networking-module` and `aks-cluster-module`.
1. **Defining input variables**: inside the `networking-module` directory, a `variables.tf` file was created to define input variables for the module. These variables include *resource_group_name*, *location*, and *vnet_address_space*.
1. **Defining Networking Resources**: In the `networking-module` directory, a `main.tf` file was created to define essential networking resources. These resources include *Azure Resource Group*, *Virtual Network* (VNet), *Control Plane Subnet*, *Worker Node Subnet*, and *Network Security Group* (NSG).
1. **Defining NSG Inbound Rules**: Rules were then added to the *Network Security Group* to allow traffic to *kube-apiserver* and *SSH* from the public IP address. These rules are crucial for the successful provisioning of the AKS cluster and ensuring its security.
1. **Defining Output Variables**: An `outputs.tf` file was then created to define output variables for the networking module. These variables include *vnet_id*, *control_plane_subnet_id*, *worker_node_subnet_id*, *networking_resource_group_name*, and *aks_nsg_id*.
1. **Initialising the Networking Module**: Lastly, the terraform initialisation command was run in the `networking-module`. This initialises the networking module, making it ready for use within the main project.

### Dependencies
Dependencies ensure that resources are provisioned in the right order within the networking module. The *Azure Resource Group* (RG) is the parent resource,  whereas the *Virtual Network* (VNet) depends on the *RG* for deployment location. As both the *Control Plane* and *Worker Node Subnets* are sub-resources they depend on the *VNet*. The *Network Security Group* (NSG) relies on the *RG* for deployment location and implicitly on the creation of *subnets* within the *VNet*. The *NSG's* presence is a requirement for *NSG Inbound Rules*. These requirements guarantee consecutive provisioning, which is necessary for the AKS cluster's networking services to be configured correctly.

## Provisioning an Azure Kubernetes Service (AKS) cluster with IaC.

This process involves defining input and output variables, configuring Azure resources, and initialising the cluster module for use within the main project.

### Defining Input Variables 
1. A `variables.tf` file was first created in the `aks-cluster-module` directory. 
1. Input variables were then defined for AKS cluster customisation, including *name*, *location*, *DNS prefix*, *Kubernetes version*, *service principal ID* and *secret*. 
1. The output variables from the networking module were included as the `networking-module` plays an important role in establishing the networking resources for the AKS cluster. 
1. A unique Service Principal name was used to prevent permission conflicts.

### Configuring Azure Resources
1. A `main.tf` file was used to input variables to set up AKS cluster resources such as *name*, *location*, *DNS prefix*, and *Kubernetes version*.
1. Default node pool settings were then defined, including *node count*, *VM size*, and *auto-scaling* parameters.
1. Lastly, the service principal authentication details were specified.<br />


### Defining Output Variables
In an `outputs.tf` file output variables were defined to store *cluster name*, *ID*, and *Kubernetes configuration file*.

### Initialising Cluster Module
The `aks-cluster-module` directory was then initialised for use within the main project.

These steps ensured the AKS clusters automated provisioning using Terraform, promoting consistency and reproducibility in infrastructure deployment.


## Creating AKS Cluster With IaC

The following steps were taken to efficiently provision an AKS cluster using Terraform and seamlessly integrate previously defined modules:

### Authentication Setup
1. **Creating a Service Principal**: First a Service Principal was created (a dedicated service account used by Terraform to interact with Azure resources securely).
2. **Defining Input Variables**: In the `variables.tf` file, both the `client_id` and `client_secret` input variables were defined. These variables will store the credentials required for authenticating Terraform with Azure. The variables were also marked as sensitive to prevent accidental exposure of sensitive information.

### Provider Configuration
1. **Creating Main Configuration File**: In the `aks-terraform` directory, a `main.tf` file was created.
2. **Azure Provider Block**: Within `main.tf`, the Azure provider block was defined to enable authentication with Azure using the service principal credentials variables created previously. The required provider configuration details such as `subscription_id` and `tenant_id` were included.

### Integration of Networking Module
1. **Including Networking Module**: The networking module was integrated into the `main.tf` configuration file.
2. **Defining Input Variables**: The input variables required by the networking module were then set:
   - `resource_group_name`: A descriptive name for the Azure Resource Group.
   - `location`: The Azure region where resources will be deployed.
   - `vnet_address_space`: The address space for the Virtual Network (VNet) in CIDR notation.

### Integration of Cluster Module
1. **Including Cluster Module**: The cluster module was integrated into the `main.tf` configuration file.
2. **Defining Input Variables**: The input variables required by the cluster module were then specified:
   - `aks_cluster_name`: The desired name for the AKS cluster.
   - `cluster_location`: The Azure region where the AKS cluster will be created.
   - `dns_prefix`: The DNS prefix for the AKS cluster, used to create a unique DNS name.
   - `kubernetes_version`: The version of Kubernetes to be used for the AKS cluster.
   - `service_principal_client_id` and `service_principal_secret`: The credentials of the service principal used for AKS cluster authentication.
   - The output variables from the networking module (`resource_group_name`, `vnet_id`, `control_plane_subnet_id`, `worker_node_subnet_id`, `aks_nsg_id`) were then used as input variables for the cluster module.

### Terraform Initialisation and Application
1. **Initialising Terraform Project**: The Terraform project was first initialised in the main project directory.
2. **Applying Terraform Configuration**: The Terraform configuration was then applied to initiate the creation of networking resources and the AKS cluster. The resultant state file was then added to `.gitignore` to avoid exposing sensitive information.

### Retrieve Kubeconfig and Test Cluster
1. **Retrieving Kubeconfig**: After provisioning the AKS cluster, the kubeconfig file was retrieved to securely connect to the cluster.
2. **Testing the Cluster**: The cluster was then connected to using the kubeconfig file to verify successful provisioning and operational status.

Thus the provisioning of the AKS cluster was effectively automated with Terraform, ensuring reliability and consistency in infrastructure deployment.

## Kubernetes Deployment to AKS

### Deployment and Service Manifests
The containerised application was deployed to a Kubernetes cluster, using Deployment and Service manifests. These manifests were defined as follows:
- **Deployment Manifest**: Initially a file named `application-manifest.yaml` is created to define the Deployment resource. Key configurations include:
  - `replicas`: Specifies the desired number of pods to run, ensuring scalability and high availability.
  - `selector`: Identifies the pods managed by the Deployment using labels.
  - `containers`: Defines the container image and exposes port 5000 for communication.
  - `strategy`: Implements Rolling Updates to ensure smooth application updates with minimal downtime.
- **Service Manifest**: Within the same `application-manifest.yaml`, a Service to facilitate internal communication was defined. Configurations include:
  - `selector`: Matches labels of pods created by the Deployment for efficient traffic routing.
  - `ports`: Specifies TCP protocol on port 80 for internal communication within the cluster, targeting port 5000 of the container.
  - `type`: Set to ClusterIP for internal service within the AKS cluster.

### Deployment Strategy
Rolling Updates was utilised as the deployment strategy for its benefits:
- **Gradual Replacement**: Old instances are replaced one at a time for a smooth transition.
- **Continuous Availability**: The application remains accessible to users throughout the update.
- **Controlled Rollout**: Operators can control the update rate and monitor progress.
- **Built-in Health Checks**: Kubernetes ensures new instances are healthy before proceeding with the update.

### Testing and Validation
After deployment, the application's functionality and reliability was validated through testing:
- **Verification**: The status and details of deployed pods and services were confirmed.
- **Port Forwarding**: Port forwarding to a local machine was initiated for efficient testing.
- **Local Access**: The application was accessed locally at http://127.0.0.1:5000.
- **Functional Testing**: All application features were tested, such as the orders table and Add Order functionality.

### Distribution to Internal Users
To distribute the application company-wide, consider using Ingress. Ingress controllers allow you to manage more advanced routing, domain-based access, and can be a powerful way to manage both internal and external traffic. However, setting up an Ingress involves provisioning a company domain, which can be a complex and costly process and so it is beyond the scope of this project.
On the other hand, if the application was customer-facing rather than for internal use, using a Load Balancer service would be the preferred choice. This setup is especially suitable when serving the application to a broader audience, such as a public website or a customer portal.


## CI/CD Pipeline Documentation

### Overview
This project repository was configured with a comprehensive CI/CD pipeline using Azure DevOps. The pipeline automates both the containerisation and deployment process, ensuring that every new feature added to the project triggers the automatic build of an updated Docker image, its release to Docker Hub, and the deployment of the updated containers to the Kubernetes cluster hosted on Azure Kubernetes Service (AKS).

### Pipeline Configuration Tasks
The tasks completed to configure the pipeline are as follows:
1. **Creation of Azure DevOps Project**: A new Azure DevOps project was created to host the CI/CD pipeline.
2. **Source Control Configuration**: GitHub was selected as the source control system, and the application code hosted in this repository was linked to the Azure DevOps project.
3. **Integration with Docker Hub**: A service connection is established between Azure DevOps and Docker Hub, enabling seamless integration with the Docker Hub container registry.
4. **Build Pipeline**: The build pipeline is set up to automatically run on each push to the main branch of this repository. It utilises a Docker task with the `buildandPush` command to build and push a Docker image to Docker Hub.
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
   - Significance: Tracks how much disk space is being utilised.
   - ![Screenshot](insert_screenshot_used_disk_percentage.png)

4. **Bytes Read and Written per Second:**
   - Provides insights into data I/O rates.
   - Significance: Helps identify potential performance bottlenecks.
   - ![Screenshot](insert_screenshot_bytes_read_written.png)

### Log Analytics
Various logs are analysed through Log Analytics:

1. **Average Node CPU Usage Percentage per Minute**
   - Significance: Tracks the CPU usage percentage at the node level over time. Monitoring CPU usage at a granular level helps detect performance anomalies, identify resource-intensive workloads, and optimise resource allocation. High CPU usage may indicate workload spikes, inefficient resource utilisation, or performance bottlenecks.

2. **Average Node Memory Usage Percentage per Minute**
   - Significance: Monitors the memory usage percentage at the node level over time. Tracking memory usage helps identify memory-intensive applications or workloads, detect memory leaks, and optimise memory allocation. High memory usage may lead to performance degradation, out-of-memory errors, or application crashes.

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
    - Response: Investigate the root cause of high disk usage and consider scaling storage resources or optimising data storage.
   
2. **CPU and Memory Usage Alerts:**
   - Alerts trigger when CPU or memory usage exceeds 80%.
   - Configuration: Ensures notification when critical resource levels are approached.
    - Response: Assess application resource demands and consider scaling resources or optimising application performance.

By implementing these monitoring strategies and response procedures, the operational efficiency of the AKS cluster is maintained, ensuring smooth operation and prompt issue resolution.

## Secrets Management and AKS Integration with Azure Key Vault

To enhance security and adhere to best practices, the project repository implements a solution for securely storing and retrieving sensitive database credentials using Azure Key Vault. Below are the details of the setup and integration:

### Azure Key Vault Setup
1. **Key Vault Creation:**
   - Azure Key Vault was created to securely store sensitive information such as database credentials.
   - Key Vault URI was then obtained, which serves as the unique address for accessing and interacting with resources stored within the Key Vault.

2. **Assign Permissions:**
   - Key Vault Administrator role was assigned to the Microsoft Enterprise ID user to grant necessary permissions for managing secrets within the Key Vault.
   - Key Vault Administrator: Grants full control over the Key Vault, enabling management of access policies and configurations.

3. **Adding Secrets:**
   - Four secrets were created in the Key Vault to secure database credentials used by the application: server name, username, password, and database name.

### AKS Integration with Azure Key Vault

4. **Managed Identity for AKS:**
   - Managed identity was enabled for the AKS cluster to allow secure authentication and interaction with the Key Vault.
   - Azure CLI commands were used to enable managed identity for the AKS cluster and retrieve information about the created managed identity such as `clientId` under identityProfile.
   - Commands include: `az aks update --resource-group <resource-group> --name <aks-cluster-name> --enable-managed-identity` & `az aks show --resource-group <resource-group> --name <aks-cluster-name> --query identityProfile`

5. **Role-Based Access Control (RBAC):**
   - The Key Vault Secrets Officer role is assigned to the managed identity associated with AKS using the `az role assignment create --role "Key Vault Secrets Officer" \ 
--assignee <managed-identity-client-id> \
--scope /subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.KeyVault/vaults/{key-vault-name}` command.
   - This role grants permissions to read, list, set, and delete secrets within the specified Azure Key Vault, enabling AKS to securely retrieve and manage secrets.

### Application Code Modifications

6. **Update Application Code:**
   - The azure-identity and Azure-Key-Vault libraries were integrated into the Python application code to enable communication with Azure Key Vault.
   - The code was also modified to use managed identity credentials for securely retrieving database connection details from the Key Vault.
   - The requirements file was then updated for the application's Docker image to include the newly required libraries.

### Testing and Validation

7. **Testing:**
   - The modified application was thoroughly tested locally to ensure seamless integration with Azure Key Vault.
   - Then it was verified that the application securely retrieves and utilises database connection details from Key Vault using managed identity credentials.

8. **Deployment:**
   - The modified application was deployed using the pre-established Azure DevOps CI/CD pipeline.
   - End-to-end testing was conducted within the AKS environment to validate the functionality of the application, ensuring secure access to Key Vault secrets directly from the CI/CD pipeline.

## UML Diagram Showing The Architecture Of The Pipeline

![UML Diagram Showing The Architecture Of The Pipeline](UML_diagram.png?raw=true)



## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
