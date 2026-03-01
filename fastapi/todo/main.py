from fastapi import FastAPI, HTTPException

from pydantic import BaseModel
from typing import Dict

from uuid import uuid4


api = FastAPI()


class Todo(BaseModel):
    title : str
    completed : bool


todos: Dict[ str, Todo ] = {}


# ===============================


@api.get("/todos")
def get_todos():
    return todos


@api.post("/todos")
def post_todos(todo: Todo):
    
    todo_id = str(uuid4())
    todos[todo_id] = todo

    return todo_id 


# ===============================


@api.get("/todos/{todo_id}")
def get_todo(todo_id: str):

    print(f"todo_id : {todo_id}")
    
    if todo_id not in todos:
        raise HTTPException(status_code=404, detail="Todo not foud")

    return todos[todo_id]



@api.put("/todos/{todo_id}")
def update_todo(todo_id: str, updated_todo: Todo):

    if todo_id not in todos:
        raise HTTPException(status_code=404, detail="Todo not found")

    todos[todo_id] = updated_todo

    return { "id" : todo_id, "updated_todo" : updated_todo }


@api.delete("/todos/{todo_id}")
def delete_todo(todo_id: str):

    if todo_id not in todos:
        raise HTTPException(status_code=404, detail="Todo not found")

    deleted = todos.pop(todo_id)

    return { "message" : "Todo deleted", "todo" : deleted }
