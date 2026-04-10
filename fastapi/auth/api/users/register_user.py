from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from uuid import uuid4

# ===========================================

from auth.db.database import get_db

from auth.models.user import User
from auth.schemas.user import UserResponseSchema, CreateUserSchema

from auth.security.password import hash_password

# ===========================================

router = APIRouter(tags=["Register User"])

# ===========================================


@router.post("/register", response_model=UserResponseSchema)
def register(user: CreateUserSchema, db: Session = Depends(get_db)):

    # assuming user is valid.
    # not doing too much stuff since it's just a fast recap.

    new_user = User(
        id=str(uuid4()),
        username=user.username,
        email=user.email,
        hashed_password=hash_password(user.password),
    )

    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    return new_user
