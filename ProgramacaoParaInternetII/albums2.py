from fastapi import FastAPI, Path, Query, HTTPException
from pydantic import BaseModel, Field
from starlette import status

from typing import Optional

app = FastAPI()

class Album:
    def __init__(self, id: int, title: str, artist: str, category: str,
                 year: int, rating: int):
        self.id = id
        self.title = title
        self.artist = artist
        self.category = category
        self.year = year
        self.reating = rating


class AlbumRequest(BaseModel):
    id: Optional[int] = Field(title='id is not needed')
    title: str = Field(min_length=1)
    artist: str = Field(min_length=1)
    category: str = Field(min_length=3, max_length=20)
    year: int = Field(gt=1950, lt=2030)
    rating: int = Field(gt=1, lt=5)


ALBUMS = [
    Album(1, 'Whos Next', 'The Who', 'rock', 1971, 5),
    Album(2, 'Led Zeppelin IV', 'Led Zeppelin', 'rock', 1971, 5),
    Album(3, 'Hunky Dory', 'David Bowie', 'rock', 1971, 5),
    Album(4, 'Electric Warrior', 'T. Rex', 'rock', 1971, 5),
    Album(5, 'Sticky Fingers', 'The Rolling Stones', 'rock', 1971, 5),
    Album(6, 'Master of Reality', 'Black Sabbath', 'metal', 1971, 5),    
]

@app.get("/albums", status_code=status.HTTP_200_OK)
async def get_all_albums():
    return ALBUMS

