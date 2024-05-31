## Getting Started Guide for New Developers

This guide will help you get started with the `docai-bigquery-demo` codebase. This project demonstrates a pipeline for integrating DocAI with BigQuery using Cloud Workflows.

**1. Project Setup**

* **Prerequisites:**
    * Google Cloud Project with billing enabled.
    * Terraform installed.
    * Basic understanding of Google Cloud services like BigQuery, GCS, Eventarc, Cloud Workflows, and DocAI.
    * Dataform CLI installed.
* **Clone the repository:**
    ```bash
    git clone https://github.com/hejnal/docai-bigquery-demo.git
    cd docai-bigquery-demo
    ```
* **Infrastructure Deployment:**
    * Navigate to the `terraform/docai-bigquery-tf` directory.
    * Replace the placeholders in `main.tf` and `backend.tf` with your project details.
    * Follow the instructions in the `README.md` file to initialize, plan, and apply the Terraform configuration. This will create the necessary infrastructure components like BigQuery datasets, GCS buckets, and networking configurations.
* **Dataform Setup:**
    * Navigate to the `dataform` directory.
    * Update the `workflow_settings.yaml` file with your project ID and desired dataset names.
    * Replace the placeholders in `definitions/process_docs.sqlx` with your use case ID and project ID.
    * Run `dataform install` to install dependencies.

**2. Understanding the Pipeline**

* **High-Level Architecture:**
    * Refer to the diagram in `diagrams/high_level_architecture.png` for a visual representation of the pipeline.
* **Workflow:**
    * The `workflows/main.yaml` file defines the Cloud Workflow that orchestrates the pipeline.
    * It triggers when a new file is uploaded to the designated GCS bucket (configured via Eventarc).
    * The workflow then:
        * Compiles the Dataform project.
        * Invokes a Dataform workflow to process the uploaded document.
        * Extracts data from the document using DocAI.
        * Cleans, parses dates, and formats the extracted data.
        * Validates the results using Dataform assertions.
        * Publishes the final results to an authorized BigQuery view.

**3. Running the Pipeline**

* **Upload a document:** Upload a supported document type (e.g., image/jpeg) to the GCS bucket that triggers the Eventarc event.
* **Monitor the workflow:** You can monitor the progress of the workflow in the Cloud Console.
* **View results:** Once the workflow completes successfully, the extracted and processed data will be available in the final BigQuery view.

**4. Code Structure**

* **`terraform`:** Contains Terraform configurations for deploying the infrastructure.
* **`dataform`:** Contains Dataform definitions for data processing and validation.
* **`workflows`:** Contains the Cloud Workflow definition.

**5. Contributing**

* **Fork the repository.**
* **Create a new branch for your changes.**
* **Submit a pull request.**

**6. Support**

* For any questions or issues, please open an issue on the GitHub repository.

This guide provides a basic overview of the `docai-bigquery-demo` codebase. For more detailed information, please refer to the documentation and code comments within each file. 
