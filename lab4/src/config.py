from enum import Enum
from os import environ

token = environ["TELEGRAM_BOT_TOKEN"]


class States(Enum):
    S_START = 0  # Начало нового диалога
    S_ENTER_NAME = 1
    S_ENTER_AGE = 2
    S_SEND_PIC = 3
