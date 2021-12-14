import telebot
from telebot import types
from config import *
import db

bot = telebot.TeleBot(token)


@bot.message_handler(commands=["start"])
@log
def cmd_start(message):
    markup = types.ReplyKeyboardMarkup(row_width=1)
    markup.add(*[types.KeyboardButton(s) for s in
                 days_in_week + ("Расписание на текущую неделю", "Расписание на следующую неделю")])
    bot.send_message(message.chat.id, "Здраствуй!", reply_markup=markup)





@bot.message_handler(commands=["week"])
@log
def cmd_week(message):
    bot.send_message(message.chat.id, f"Текущая неделя: {'верхняя' if get_week_id() else 'нижняя'}")


@bot.message_handler(commands=["help"])
@log
def cmd_help(message):
    bot.send_message(message.chat.id, "Бот расписания группы БВТ2104 МТУСИ")
    bot.send_message(message.chat.id,
                     "При нажатии на кнопку с днем недели бот должен выводить информацию из базы данных с расписанием на выбранный день текущей недели\n"
                     "При нажатии на кнопку 'Расписание на текущую неделю' бот должен выводить информацию из базы данных с расписанием на всю текущую неделю\n"
                     "При нажатии на кнопку 'Расписание на следующую неделю' бот должен выводить информацию из базы данных с расписанием на всю следующую неделю неделю\n"
                     "При использовании команды /week бот должен выводить какая на данный момент неделя – верхняя/нижняя\n"
                     "При использовании команды /mtuci бот должен выводить ссылку на официальный сайт МТУСИ – https://mtuci.ru/\n"
                     "При использовании команды /help бот должен выводить краткую информацию о себе, краткую документацию и список команд с их пояснениями.")


@bot.message_handler(commands=["mtuci"])
@log
def cmd_url(message):
    bot.send_message(message.chat.id, "https://mtuci.ru/")


def send_week(user_id, week_delta):
    for i, day in enumerate(db.get_schedule_for_week(get_week_id() ^ week_delta)):
        bot.send_message(user_id, days_in_week[i])
        bot.send_message(user_id, '\n'.join(day) if day else "Выходной")


@bot.message_handler(regexp=' *Расписание на текущую неделю *')
@log
def week0(message):
    send_week(message.chat.id, 0)


@bot.message_handler(regexp=' *Расписание на следующую неделю *')
@log
def week1(message):
    send_week(message.chat.id, 1)


@bot.message_handler(func=lambda message: message.text.strip().lower() in days_in_week_lower)
@log
def get_day(message):
    data = db.get_schedule_for_day(get_week_id(), days_in_week_lower.index(message.text.strip().lower()))
    bot.send_message(message.chat.id, '\n'.join(data) if data else "Отдых")


@bot.message_handler()
@log
def unrecognized_text(message):
    bot.send_message(message.chat.id, "Извините, я Вас не понял")


if __name__ == '__main__':
    bot.infinity_polling()
