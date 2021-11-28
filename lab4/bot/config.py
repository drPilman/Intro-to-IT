from os import environ
import logging
from functools import partial

if environ["DEBUG"] == "YES":
    logging.basicConfig(level=logging.DEBUG,
                        format="%(asctime)s - %(levelname)s :  %(message)s")
else:
    logging.basicConfig(level=logging.INFO,
                        format="%(asctime)s - %(levelname)s :  %(message)s")


def debug(f, logger_normal=logging.debug):
    def dec(*args, **kwargs):
        s = f"Run {f.__name__} with args( {args}{' | ' + str(kwargs) if kwargs else ''} )"
        try:
            logger_normal(s)
            return f(*args, **kwargs)
        except Exception as e:
            logging.error(f"Error while {s} with message {e}")

    return dec


log = partial(debug, logger_normal=logging.info)

token = environ["TELEGRAM_BOT_TOKEN"]
wait_list=["начнешь беседу","введешь свое имя","введешь текст для демотиватора","отправишь мне картинку"]

class States:
    S_START = 0  # Начало нового диалога
    S_ENTER_NAME = 1
    S_ENTER_TEXT = 2
    S_SEND_PIC = 3

    def waiting_for(state):
        return wait_list[state]

enter_text = "Введи текст для демотиватора"
