from fastapi import FastAPI

from pydantic import BaseModel


api = FastAPI()


class Todo(BaseModel):
    title : str
    completed : bool


todos = []


@api.get("/todos")
def get_todos():
    return todos


@api.post("/todos")
def post_todos(todo: Todo):
    todos.append(todo)
    return todo
