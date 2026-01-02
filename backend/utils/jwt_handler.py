import base64

from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import ec
from jose import jwt

from core.config import config


def base64url_decode(data: str) -> bytes:
    data += "=" * ((4 - len(data) % 4) % 4)
    return base64.urlsafe_b64decode(data)


def jwks_from_env():
    x = int.from_bytes(base64url_decode(config.JWKS_X), "big")
    y = int.from_bytes(base64url_decode(config.JWKS_Y), "big")
    public_numbers = ec.EllipticCurvePublicNumbers(x, y, ec.SECP256R1())
    return public_numbers.public_key(default_backend())


def validate_token(token: str):
    public_key = jwks_from_env()
    try:
        payload = jwt.decode(
            token,
            public_key,
            algorithms=[config.JWKS_ALG],
            options={"verify_aud": False},
        )
        return payload
    except jwt.ExpiredSignatureError:
        raise Exception("Token expired")
    except jwt.JWTError as e:
        raise Exception(f"Invalid token: {e}")
