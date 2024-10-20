import 'package:flutter/material.dart';
import 'package:portfolio_web/screen/about/component/info_widget.dart';
import 'package:portfolio_web/screen/about/component/skill_widget.dart';

Map<String, dynamic> myData = {
  "menu": {
    "menu_width": 1.5,
    "profile_img":
        "https://drive.usercontent.google.com/u/0/uc?id=1VdhHb7L8XWOmmcAZXEJSikItgiBefKI3",
  },
  "main_content": {
    "name": "Pyae Hein Tun",
    "title": "Software Engineer",
    "description":
        "I'm a Software Engineer with expertise in both frontend and backend development. I work with a variety of technologies to create full-stack solutions, building intuitive user interfaces and scalable server-side systems."
  },
  "about_content": {
    "info_list": [
      InfoData(name: "Birthday", data: "23 Apirl 1998"),
      InfoData(name: "Age", data: "26"),
      InfoData(name: "Country", data: "Myanmar"),
      InfoData(name: "Uni", data: "MTU"),
      InfoData(name: "Degree", data: "Mechatronics"),
      InfoData(name: "Phone", data: "+959250968377"),
      InfoData(name: "City", data: "Mandalay"),
      InfoData(name: "Status", data: "RS"),
    ],
    "skill_list": [
      SkillData(name: "JS", percent: 68),
      SkillData(name: "Java", percent: 90),
      SkillData(name: "Python", percent: 80),
      SkillData(name: "Dart", percent: 80),
    ],
  },
  "colors": {
    "background_color": Colors.black,
    "menu_color": const Color.fromARGB(255, 35, 35, 35),
    "text_color": Colors.white,
    "primary_color": const Color.fromARGB(255, 255, 123, 0),
  }
};
