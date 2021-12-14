from os import environ
import logging
from functools import partial
from datetime import datetime, date, timezone, timedelta

moscow = timezone(timedelta(hours=3))
now = partial(datetime.now, moscow)

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


def get_week_id():
    time = now().date()
    return ((time - date(time.year, 9, 6)).days // 7) % 2


days_in_week = ("Понедельник", "Вторник", "Среда", "Четверг", "Пятница")

days_in_week_lower = tuple(x.lower() for x in days_in_week)

