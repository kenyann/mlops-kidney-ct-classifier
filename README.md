# MLOps Kidney CT Scan classification
## Introduction
The primary objective of this project is to develop a robust and scalable system for classifying kidney tumors from CT scan images. Leveraging state-of-the-art Machine Learning models and MLOps practices.

**Approach:**
1. **Data Collection and Preprocessing:** Curating a diverse dataset of kidney CT scan images with associated labels, ensuring sufficient representation of different tumor types and stages. Preprocessing techniques such as normalization are applied to enhance model generalization. Data versioning with DVC
2. **Model Development:** Designing and training deep learning models tailored for kidney tumor classification. This involves experimenting with various architectures, optimizing hyperparameters, and evaluating model performance using metrics such as accuracy, sensitivity, and specificity. Experiments tracking with MLflow
3. **MLOps Integration:** Implementing MLOps practices to streamline the end-to-end ML lifecycle. This includes version control of code and models, automated testing, continuous integration/continuous deployment (CI/CD) pipelines. Model monitoring, and performance tracking **is not implement yet**.
4. **Deployment and Integration:** Deploying the trained model into Heroku 

![image alt text](</image/TrainingPipeline.png>)

## Project Structure
```txt
├── Dockerfile                              - Dockerfile for building the image
├── README.md                               - This is README file
├── app.py                                  - Flask Framework for Demo
├── config                                  - Directory for Project config file
│   └── config.yaml                         
├── dvc.yaml                                - DVC config file
├── logs                                    - Directory for Logs file
│   └── running_logs.log
├── main.py                                 - Main Python script for the application 
├── params.yaml                             - Parameters config for training stage
├── requirements.txt                        - Project requirements
├── research                                - Directory for research
│   ├── 01_data_ingestion.ipynb
│   ├── 02_prepare_base_model.ipynb
│   ├── 03_model_training.ipynb
│   ├── 04_model_evaluation.ipynb
│   └── trials.ipynb
├── setup.py                                - Setup file for packaging and distributing project
├── src                                     - Directory for sources
│   ├── cnnClassifier
│       ├── __init__.py
│       ├── components                      - Directory for the components of project
│       │   ├── __init__.py
│       │   ├── data_ingestion.py
│       │   ├── evaluation.py
│       │   ├── prepare_base_model.py
│       │   └── training.py
│       ├── config                          - Directory for the configuration of entities in project
│       │   ├── __init__.py
│       │   └── configuration.py
│       ├── constants                       - Directory for the constants of project
│       │   └── __init__.py
│       ├── entity                          - Directory for the entities in project
│       │   ├── __init__.py
│       │   └── config_entity.py
│       ├── pipeline                        - Directory for the pipeline of project
│       │   ├── __init__.py
│       │   ├── prediction.py
│       │   ├── stage_01_data_ingestion.py
│       │   ├── stage_02_prepare_base_model.py
│       │   ├── stage_03_training.py
│       │   └── stage_04_evaluation.py
│       └── utils                           - Directory for utils function
│           ├── __init__.py
│           └── common.py
└── templates                               - Directory of demo web UI
    └── index.html
```
## Install
Create a venv (Recommend)

Install requirements.txt in a **Python>=3.9** environment

```bash
pip install -r requirements.txt
```
Initialize DVC and run the pipeline 
```bash 
dvc init
dvc repro
```
Running the demo
```bash
gunicorn --bind 0.0.0.0:8080 app:app
```
## Running on Docker
```bash
docker build . -t <repository_name>
docker run --name <name> -p 8080 <repository_name>
```

## Heroku CICD Deployment with Github Action
![image alt text](</image/CICD.png>)

1. Login to Heroku
2. Connect Github repo to Heroku
3. Create App on Heroku
4. Setup Github secrets:

    HEROKU_API_KEY

    HEROKU_APP_NAME

    HEROKU_EMAIL

![image alt text](</image/Heroku_app.png>)

<!-- ```text
+----------------+            +--------------------+
| data_ingestion |            | prepare_base_model |
+----------------+*****       +--------------------+
         *             *****             *
         *                  ******       *
         *                        ***    *
         **                        +----------+
           **                      | training |
             ***                   +----------+
                ***             ***
                   **         **
                     **     **
                  +------------+
                  | evaluation |
                  +------------+
``` -->