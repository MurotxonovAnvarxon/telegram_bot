import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

var teledart;

void main() async {
  var BOT_TOKEN = '7308736935:AAGfgfwhnWk6v2JMaRN37OuhTOaUqNJI42U';
  final username = (await Telegram(BOT_TOKEN).getMe()).username;
  teledart = TeleDart(BOT_TOKEN, Event(username!));

  messageSend();
  startListen();
  help();
  about();
  report();
  contact();
  info();
  settings();
  feedback();
  cancel();
  setupCommands();

  //teledartga start berildi
  teledart.start();
  //app run qilindi
  runApp(MyApp());
}

void settings() {
  teledart.onCommand('settings').listen((message) {
    message.reply(
        'Bu yerda botning sozlamalarini ko\'rishingiz va o\'zgartirishingiz mumkin.');
  });
}

void report(){
  teledart.onCommand('report').listen((message) {
    message.reply('Xatolik haqida qisqacha yozib bering.');
  });

}

void info(){
  teledart.onCommand('info').listen((message) {
    message.reply('Sizning Telegram ID: ${message.from.id}');
  });

}


void feedback(){teledart.onCommand('feedback').listen((message) {
  message.reply('Fikr-mulohazalaringizni yozing va bizga yuboring!');
});
}
void cancel(){
  teledart.onCommand('cancel').listen((message) {
    message.reply('Operatsiya bekor qilindi.');
  });

}
void contact(){
  teledart.onCommand('contact').listen((message) {
    message.reply('Biz bilan bog\'lanish uchun anvarxonmurotxonov777@gmail.com manziliga yozing.');
  });

}

void about(){teledart.onCommand('about').listen((message) {
  message.reply('Bu bot [tashkilot] tomonidan ishlab chiqilgan va quyidagi maqsadlar uchun mo\'ljallangan...');
});


}

void messageSend() {
  teledart
      .onMessage(keyword: 'Salom') //keywordni o'chirib qoyish ham mumkin
      .listen((message) => message.reply('Hi user!'));
}

void setupCommands() {
  // Barcha komandalarni belgilash
  final commands = [
    'Start',
    'Help',
    'Menu',
    'Settings',
    'About',
    'Contact',
    'Cancel',
    'Info',
    'Feedback',
    'Report',
    "Game"
  ];

  // Klaviaturani yaratish
  var keyboard = ReplyKeyboardMarkup(
    keyboard: commands.map((command) => [KeyboardButton(text: command)]).toList(),
    resizeKeyboard: true,
    oneTimeKeyboard: true,
  );

  // /menu buyrug'ini tinglash
  teledart.onCommand('menu').listen((message) {
    teledart.sendMessage(
      message.chat.id,
      'Komandani tanlang:',
      replyMarkup: keyboard,
    );
  });

  // Klaviaturadan xabarlarni tinglash va tegishli javobni qaytarish
  teledart.onMessage().listen((message) {
    switch (message.text) {
      case 'Start':
        message.reply('Botga xush kelibsiz!');
        break;
      case 'Help':
        message.reply('Bu bot sizga quyidagi imkoniyatlarni beradi...');
        break;
      case 'Menu':
        teledart.sendMessage(
          message.chat.id,
          'Komandani tanlang:',
          replyMarkup: keyboard,
        );
        break;
      case 'Settings':
        message.reply('Bu yerda botning sozlamalarini ko\'rishingiz va o\'zgartirishingiz mumkin.');
        break;
      case 'About':
        message.reply('Bu bot [tashkilot] tomonidan ishlab chiqilgan va quyidagi maqsadlar uchun mo\'ljallangan...');
        break;
      case 'Contact':
        message.reply('Biz bilan bog\'lanish uchun anvarxonmurotxonov777@gmail.com manziliga yozing.');
        break;
      case 'Cancel':
        message.reply('Operatsiya bekor qilindi.');
        break;
      case 'Info':
        message.reply('Sizning Telegram ID: ${message.from.id}');
        break;
      case 'Feedback':
        message.reply('Fikr-mulohazalaringizni yozing va bizga yuboring!');
        break;
      case 'Report':
        message.reply('Xatolik haqida qisqacha yozib bering.');
        break;
        //
      case 'Game':
      // O'yin taklif qilish
        teledart.sendGame(
          message.chat.id,
          'kingdomsof2048', // Bu erda sizning o'yiningizning 'short_name' kiriting
          replyMarkup: InlineKeyboardMarkup(
            inlineKeyboard: [
              [
                InlineKeyboardButton(
                  text: 'O\'yinni boshlash',
                  callbackData: 'play_game',
                  url: 'https://prizes.gamee.com/game-bot/kingdomsof2048-e9d11213bdc9a5c1fb2b7b9c803561f17100a8a0#tgShareScoreUrl=tg%3A%2F%2Fshare_game_score%3Fhash%3DZObwMMfeHvbEuLdW_mjfpQJOkKqWX3nDoB05CmyKdh-sfJZr6cxyXpZC45-QcvOS',
                ),
              ],
            ],
          ),
        );
        break;

      default:
      // Agar boshqa xabar kelsa, javob qaytarmaslik
        break;
    }
  });
}


void help() {
  teledart.onCommand('help').listen((message) {
    message.reply('Bu bot sizga quyidagi imkoniyatlarni beradi...');
  });
}



void startListen() {
  teledart
      .onCommand('start')
      .listen((message) => message.reply('Assalomu aleykum hurmatli mijoz!'));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
