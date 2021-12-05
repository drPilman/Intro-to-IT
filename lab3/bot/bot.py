import telebot
from config import *
import db
import threading
from opencv import demotivator

bot = telebot.TeleBot(token)


@debug
def process_image(message):
    file_info = bot.get_file(message.photo[len(message.photo) - 1].file_id)
    downloaded_file = bot.download_file(file_info.file_path)
    src = '/tmp/' + message.photo[0].file_id + '.jpg'
    with open(src, 'wb') as new_file:
        new_file.write(downloaded_file)
    demotivator(src, db.get(message.chat.id).text)
    with open(src, 'rb') as file:
        bot.send_photo(message.chat.id, file)


def state(value):
    def checker(message):
        return db.get(message.chat.id).state == value

    return checker


def state_change(f):
    def ret_fun(message):
        x = f(message)
        if x:
            logging.info(f"Set state of {message.chat.id} to {x}")
            db.get(message.chat.id).state = x
            db.session.commit()

    return ret_fun


@bot.message_handler(commands=["start"])
@bot.message_handler(func=state(States.S_START))
@state_change
@log
def cmd_start(message):
    bot.send_message(message.chat.id, "Привет! Как я могу к тебе обращаться?")
    return States.S_ENTER_NAME

@bot.message_handler(commands=["help"])
@log
def cmd_start(message):
    bot.send_message(message.chat.id, "Я могу создать демотиватор.\nДля этого тебе необходимо представится, ввести текст и отправить изображение")


@bot.message_handler(commands=["reset"])
@state_change
@log
def cmd_reset(message):
    bot.send_message(message.chat.id, "Что ж, начнём по-новой. Как тебя зовут?")
    return States.S_ENTER_NAME


@bot.message_handler(func=state(States.S_ENTER_NAME))
@state_change
@log
def user_entering_name(message):
    db.get(message.chat.id).name = message.text.strip()
    bot.send_message(message.chat.id, "Отличное имя, запомню!\nТеперь ты можешь пользоваться сервисом")
    bot.send_message(message.chat.id, enter_text)
    return States.S_ENTER_TEXT


@bot.message_handler(func=state(States.S_ENTER_TEXT))
@state_change
@log
def user_entering_text(message):
    text = message.text.strip()
    if not text:
        bot.send_message(message.chat.id, "Что-то не так, введи текст ещё раз!")
        return
    if len(text) > 20:
        bot.send_message(message.chat.id, "Слишком длинный текст, попробуй еще раз...")
        return
    else:
        db.get(message.chat.id).text = text
        bot.send_message(message.chat.id, "Теперь отправь мне фотографию.")
        return States.S_SEND_PIC


@bot.message_handler(func=state(States.S_SEND_PIC), content_types=["photo"])
@state_change
@log
def recive_image(message):
    threading.Thread(target=process_image, args=(message,)).start()
    bot.send_message(message.chat.id, "Фото обрабатывается")
    bot.send_message(message.chat.id, "Если понадобится сделать новый демотиватор, введи текст")
    return States.S_ENTER_TEXT


@bot.message_handler()
@log
def recive_image(message):
    bot.send_message(message.chat.id, "Что-то не так, попробуй ещё раз!")
    bot.send_message(message.chat.id, "Я жду что ты " + States.waiting_for(db.get(message.chat.id).state))


if __name__ == '__main__':
    bot.infinity_polling()
