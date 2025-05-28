# notifier/config.py

from pydantic import BaseSettings
from pathlib import Path
from dotenv import load_dotenv

env_path = Path(__file__).resolve().parent.parent / ".env"
load_dotenv(dotenv_path=env_path)

class Settings(BaseSettings):
    DB_SERVER: str
    DB_PORT: int
    DB_NAME: str
    DB_USER: str
    DB_PASSWORD: str

    HOST: str = "127.0.0.1"
    PORT: int = 8000

    @property
    def DB_URL(self) -> str:
        return (
            f"mssql+pyodbc://{self.DB_USER}:{self.DB_PASSWORD}"
            f"@{self.DB_SERVER},{self.DB_PORT}/{self.DB_NAME}"
            f"?driver=ODBC+Driver+17+for+SQL+Server"
        )

SETTINGS = Settings()
