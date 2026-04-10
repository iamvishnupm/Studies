from datetime import datetime, timedelta
from jose import jwt, JWTError

from auth.security.config import ACCESS_TOKEN_LIFE, SECRET_KEY, ALGORITHM


def create_access_token(data: dict, expire_delta: timedelta | None = None):
    to_encode = data.copy()

    if expire_delta:
        expiry = datetime.now() + expire_delta

    else:
        expiry = datetime.now() + timedelta(minutes=ACCESS_TOKEN_LIFE)

    to_encode.update({"exp": expiry})

    return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
