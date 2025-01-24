from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import subprocess

app = FastAPI()

class CommandRequest(BaseModel):
    script: str
    args: list[str] = []

@app.post("/execute/")
async def execute_script(request: CommandRequest):
    command = f"./{request.script} {' '.join(request.args)}"

    try:
        result = subprocess.run(command, shell=True, capture_output=True, text=True)
        if result.returncode != 0:
            raise HTTPException(status_code=400, detail=result.stderr.strip())
        return {"output": result.stdout.strip()}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
