from pathlib import Path
from dotenv import load_dotenv
import os

load_dotenv()

CONFIG_FILE_PATH = Path("config/config.yaml")
PARAMS_FILE_PATH = Path("params.yaml")

MLFLOW_TRACKING_URI = os.environ.get('MLFLOW_TRACKING_URI')
MLFLOW_TRACKING_USERNAME = os.environ.get('MLFLOW_TRACKING_USERNAME')
MLFLOW_TRACKING_PASSWORD = os.environ.get('MLFLOW_TRACKING_PASSWORD')
