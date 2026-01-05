from typing import Any, Dict

from huggingface_hub import InferenceClient
from sqlalchemy.util.typing import TypedDict

from core.config import config


class Message(TypedDict):
    role: str
    content: str


class HuggingFaceService:
    def __init__(self) -> None:
        pass

    def scan(self, image_bytes: bytes, content_type: str) -> Dict[str, Any]:
        client = InferenceClient(
            api_key=config.HF_TOKEN,
            headers={"Content-Type": content_type},
        )
        try:
            result = client.image_classification(
                image_bytes,
                model="dima806/fairface_age_image_detection",
            )

            return {
                "type": "image_classification",
                "result": result,
            }
        except Exception as e:
            raise Exception(str(e))


_hugging_face_service: HuggingFaceService | None = None


def get_hugging_face_service() -> HuggingFaceService:
    global _hugging_face_service
    if _hugging_face_service is None:
        _hugging_face_service = HuggingFaceService()
    return _hugging_face_service
