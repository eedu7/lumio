from fastapi import Depends, HTTPException, Request
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer

from utils.jwt_handler import validate_token

auth_scheme = HTTPBearer(auto_error=False)


async def get_current_user(
    request: Request,
    credentials: HTTPAuthorizationCredentials = Depends(auth_scheme),
):
    if credentials is None or credentials.scheme.lower() != "bearer":
        raise HTTPException(status_code=401, detail="Missing or invalid Authorization header")

    token = credentials.credentials
    try:
        payload = validate_token(token)
    except Exception as e:
        raise HTTPException(status_code=401, detail=str(e))

    request.state.user = type("User", (), {})()
    request.state.user.id = payload.get("sub")
