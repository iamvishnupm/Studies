from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

# ===========================================

from auth.db.database import get_db

from auth.models.user import User
from auth.schemas.user import UserResponseSchema, LoginUserSchema

from auth.security.password import verify_password
from auth.security.token import create_access_token

# ===========================================

router = APIRouter(tags=["Login User"])

# ===========================================


@router.post("/login")
def login(user: LoginUserSchema, db: Session = Depends(get_db)):

    db_user = db.query(User).filter_by(username=user.username).first()

    if not db_user or not verify_password(user.password, db_user.hashed_password):
        raise HTTPException(status_code=401, detail=["Invalid Credential"])

    access_token = create_access_token({"sub": db_user.id})

    return {"access_token": access_token, "token_type": "bearer"}
