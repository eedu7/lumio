# core/schemas/address.py
from uuid import UUID

from pydantic import BaseModel, ConfigDict


class AddressRead(BaseModel):
    id: UUID
    full_name: str
    phone: str
    address_line: str
    city: str
    state: str | None = None
    address_type: str
    is_default: bool

    model_config = ConfigDict(from_attributes=True)


class AddressCreate(BaseModel):
    full_name: str
    phone: str
    address_line: str
    city: str
    state: str | None = None
    address_type: str
    is_default: bool = False


class AddressUpdate(BaseModel):
    full_name: str
    phone: str
    address_line: str
    city: str
    state: str | None = None
    address_type: str
    is_default: bool


class AddressPartialUpdate(BaseModel):
    full_name: str | None = None
    phone: str | None = None
    address_line: str | None = None
    city: str | None = None
    state: str | None = None
    address_type: str | None = None
    is_default: bool | None = None
