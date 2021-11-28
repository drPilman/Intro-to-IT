import psycopg2
from config import *
from sqlalchemy import *
from sqlalchemy.orm import declarative_base
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship, Session
from sqlalchemy.ext.associationproxy import association_proxy
import json

Base = declarative_base()
engine = create_engine(
    f'postgresql+psycopg2://{environ["POSTGRES_USER"]}:{environ["POSTGRES_PASSWORD"]}@{environ["URL_DB"]}:{environ["PORT_DB"]}/{environ["POSTGRES_DB"]}')
session = Session(engine, future=True)


class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    chat_id = Column(Integer, nullable=False)
    state = Column(Integer, nullable=False, default=0)
    name = Column(String, nullable=True)
    text = Column(String, nullable=True)
    count = Column(Integer, nullable=False, default=0)

    def __repr__(self):
        return ' | '.join(map(str, (self.id, self.chat_id, self.state, self.name, self.text, self.count)))

@debug
def get(chat_id):
    result = session.query(User).filter(User.chat_id == chat_id).first()
    if result:
        logging.debug(f"{chat_id} is {result}")
    else:
        result = User(chat_id=chat_id)
        session.add(result)
        session.commit()
    return result


