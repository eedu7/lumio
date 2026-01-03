from uuid import UUID

from fastapi import APIRouter, Depends, HTTPException, Request, status
from sqlalchemy import select

from core.dependencies import SessionDep
from core.dependencies.authentication import get_current_user
from core.models import Address
from core.schemas.address import AddressCreate, AddressRead, AddressUpdate

router = APIRouter(dependencies=[Depends(get_current_user)])


@router.post("/", response_model=AddressRead, status_code=status.HTTP_201_CREATED)
async def create_address(
    payload: AddressCreate,
    request: Request,
    session: SessionDep,
):
    user_id = request.state.user.id

    address = Address(**payload.model_dump(), user_id=user_id)
    session.add(address)
    await session.commit()
    await session.refresh(address)

    return address


@router.get("/", response_model=list[AddressRead])
async def get_all_addresses(
    request: Request,
    session: SessionDep,
):
    user_id = request.state.user.id

    result = await session.execute(select(Address).where(Address.user_id == user_id))
    return result.scalars().all()


@router.get("/{address_id}", response_model=AddressRead)
async def get_address_by_id(
    address_id: UUID,
    request: Request,
    session: SessionDep,
):
    user_id = request.state.user.id

    result = await session.execute(
        select(Address).where(
            Address.id == address_id,
            Address.user_id == user_id,
        )
    )
    address = result.scalar_one_or_none()

    if not address:
        raise HTTPException(status_code=404, detail="Address not found")

    return address


@router.put("/{address_id}", response_model=AddressRead)
async def update_address(
    address_id: UUID,
    payload: AddressUpdate,
    request: Request,
    session: SessionDep,
):
    user_id = request.state.user.id

    result = await session.execute(
        select(Address).where(
            Address.id == address_id,
            Address.user_id == user_id,
        )
    )
    address = result.scalar_one_or_none()

    if not address:
        raise HTTPException(status_code=404, detail="Address not found")

    for key, value in payload.model_dump().items():
        setattr(address, key, value)

    await session.commit()
    await session.refresh(address)

    return address


@router.delete("/{address_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_address(
    address_id: UUID,
    request: Request,
    session: SessionDep,
):
    user_id = request.state.user.id

    result = await session.execute(
        select(Address).where(
            Address.id == address_id,
            Address.user_id == user_id,
        )
    )
    address = result.scalar_one_or_none()

    if not address:
        raise HTTPException(status_code=404, detail="Address not found")

    await session.delete(address)
    await session.commit()
