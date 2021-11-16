import telebot
from config import *
import db

bot = telebot.TeleBot(token)


# Начало диалога
@bot.message_handler(commands=["start"])
def cmd_start(message):
    bot.send_message(message.chat.id, "Привет! Как я могу к тебе обращаться?")
    db.set_state(message.chat.id, States.S_ENTER_NAME)


# По команде /reset будем сбрасывать состояния, возвращаясь к началу диалога
@bot.message_handler(commands=["reset"])
def cmd_reset(message):
    bot.send_message(message.chat.id, "Что ж, начнём по-новой. Как тебя зовут?")
    db.set_state(message.chat.id, States.S_ENTER_NAME)


def state(value):
    def checker(message):
        return db.get_current_state(message.chat.id) == value

    return checker


def state_change(f):
    def ret_fun(message):
        x = f(message)
        if x:
            db.set_state(message.chat.id, x)

    return ret_fun


@bot.message_handler(func=state(States.S_ENTER_NAME))
def user_entering_name(message):
    bot.send_message(message.chat.id, "Отличное имя, запомню! Теперь укажи, пожалуйста, свой возраст.")
    return States.S_ENTER_AGE


@bot.message_handler(func=state(States.S_ENTER_AGE))
def user_entering_age(message):
    if not message.text.isdigit():
        bot.send_message(message.chat.id, "Что-то не так, попробуй ещё раз!")
        return
    if int(message.text) < 5 or int(message.text) > 100:
        bot.send_message(message.chat.id, "Какой-то странный возраст. Не верю! Отвечай честно.")
        return
    else:
        bot.send_message(message.chat.id, "Отправь мне какую-нибудь фотографию.")
        return States.S_SEND_PIC


if __name__ == '__main__':
    bot.infinity_polling()
