from typing import List

from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

# ===========================================

from auth.db.database import get_db

from auth.models.user import User
from auth.schemas.user import UserResponseSchema

from auth.security.user import get_current_user

# ===========================================

router = APIRouter(tags=["Getters"])

# ===========================================


@router.get("/users", response_model=List[UserResponseSchema])
def get_all_users(db: Session = Depends(get_db)):
    return db.query(User).all()


@router.get("/me")
def get_me(user: User = Depends(get_current_user)):
    return {
        "id": user.id,
        "username": user.username,
        "email": user.email,
    }
