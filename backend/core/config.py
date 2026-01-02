from pydantic_settings import BaseSettings, SettingsConfigDict


class Config(BaseSettings):
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

    model_config = SettingsConfigDict(
        env_file=".env", env_file_encoding="utf-8", case_sensitive=True, extra="ignore"
    )


config = Config()
