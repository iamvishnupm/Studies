from pydantic import BaseModel
from typing import List

from fastapi import FastAPI

class Numbers(BaseModel):
    nums : List[int]


api = FastAPI()


@api.post("/add")
def add(data: Numbers):

    n = len(data.nums)

    return (" + ".join( ["{}"] * n ) ).format( *data.nums ) + f" = { sum(data.nums) }"


@api.get("/multiply/{x}/{y}")
def multiply(x: int, y: int):
    return f"{x} x {y} = { x * y }"
