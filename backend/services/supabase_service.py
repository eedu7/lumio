from supabase import create_client

from core.config import config


class SupabaseService:
    def __init__(self):
        self.client = create_client(
            supabase_url=config.SUPABASE_PROJECT_URL,
            supabase_key=config.SUPABASE_SECRET_KEY,
        )
        self.bucket_name = config.SUPABASE_BUCKET_NAME

    def upload_image(
        self,
        file_bytes: bytes,
        file_name: str,
    ) -> str:
        try:
            self.client.storage.from_(self.bucket_name).upload(
                path=file_name,
                file=file_bytes,
            )
        except Exception as e:
            raise Exception(f"Supabase failed to upload image: {e}")

        try:
            return self.client.storage.from_(self.bucket_name).get_public_url(file_name)
        except Exception as e:
            raise Exception(f"Supabase failed to get public image url: {e}")


def get_supabase_service() -> SupabaseService:
    return SupabaseService()
