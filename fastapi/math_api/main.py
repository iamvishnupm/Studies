from fastapi import FastAPI


app = FastAPI()

@app.get("/add/{x}/{y}")
def add(x: int, y: int):
    return f"{x} + {y} = { x + y }"
