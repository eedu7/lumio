from pydantic_settings import BaseSettings, SettingsConfigDict


class Config(BaseSettings):
    # Hugging Face
    HF_TOKEN: str = ""
    # Supabase
    SUPABASE_PROJECT_URL: str = ""
    SUPABASE_PROJECT_REF: str = ""
    SUPABASE_SECRET_KEY: str = ""
    SUPABASE_ISSUER: str = ""
    SUPABASE_BUCKET_NAME: str = ""

    # Database
    DATABASE_URL: str = ""

    # JWKS
    JWKS_URL: str = ""
    JWKS_X: str = ""
    JWKS_Y: str = ""
    JWKS_ALG: str = ""
    JWKS_CRV: str = ""
    JWKS_KID: str = ""
    JWKS_KTY: str = ""

    model_config = SettingsConfigDict(
        env_file=".env", env_file_encoding="utf-8", case_sensitive=True, extra="ignore"
    )


config = Config()
