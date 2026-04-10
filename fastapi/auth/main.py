from dotenv import load_dotenv

load_dotenv()

# ===========================================

from fastapi import FastAPI

# ===========================================

from auth.db.base import Base
from auth.db.database import engine

from auth.api.users import get_data, login_user, register_user

# ===========================================

Base.metadata.create_all(bind=engine)

api = FastAPI()

api.include_router(register_user.router)
api.include_router(login_user.router)
api.include_router(get_data.router)


# ===========================================


@api.get("/", include_in_schema=False)
def home():
    return "Welcome Home"
