import os

SECRET_KEY = os.getenv("SECRET_KEY")
ACCESS_TOKEN_LIFE = int(os.getenv("ACCESS_TOKEN_LIFE"))
ALGORITHM = os.getenv("ALGORITHM")
