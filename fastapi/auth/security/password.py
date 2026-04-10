from passlib.context import CryptContext

pwd_context = CryptContext(
    schemes=["bcrypt"],  # algorithm(s) used.
    deprecated="auto",  # marks old hashes as outdated when config changes, allowing automatic rehash on next successful login
)


def hash_password(password: str) -> str:
    return pwd_context.hash(password)


def verify_password(plain_password: str, hashed_password: str) -> bool:
    return pwd_context.verify(plain_password, hashed_password)
