from pydantic import BaseModel, EmailStr


class LoginUserSchema(BaseModel):
    username: str
    password: str


class CreateUserSchema(BaseModel):
    email: EmailStr
    username: str
    password: str


class UserResponseSchema(BaseModel):
    id: str
    username: str
    email: EmailStr

    class Config:
        from_attributes = True
