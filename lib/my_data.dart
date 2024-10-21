import 'package:flutter/material.dart';
import 'package:portfolio_web/screen/about/component/education_widget.dart';
import 'package:portfolio_web/screen/about/component/info_widget.dart';
import 'package:portfolio_web/screen/about/component/skill_widget.dart';
import 'package:portfolio_web/screen/contact/contact_screen.dart';
import 'package:portfolio_web/screen/projects/component/project_content.dart';

Map<String, dynamic> myData = {
  "menu": {
    "menu_width": 1.5,
    "profile_img": "https://i.imgur.com/mhKfENA.jpeg",
  },
  "main_content": {
    "name": "Pyae Hein Tun",
    "title": "Software Engineer",
    "cv_url":
        "https://drive.usercontent.google.com/u/0/uc?id=1lZJz7b190mjf756-wTrnKvPTAS4o8wPz&export=download",
    "description":
        "I'm a Software Engineer with expertise in both frontend and backend development. I work with a variety of technologies to create full-stack solutions, building intuitive user interfaces and scalable server-side systems."
  },
  "about_content": {
    "info_list": [
      InfoData(name: "Birthday", data: "23 Apirl 1998"),
      InfoData(name: "Age", data: "26"),
      InfoData(name: "Country", data: "Myanmar"),
      InfoData(name: "Language", data: "Myanmar,English,Japan"),
      InfoData(name: "Degree", data: "Mechatronics"),
      InfoData(name: "Phone", data: "(+95) 9250968377"),
      InfoData(name: "City", data: "Mandalay"),
      InfoData(name: "Status", data: "Single"),
    ],
    "skill_list": [
      SkillData(name: "JS", percent: 68),
      SkillData(name: "Java", percent: 90),
      SkillData(name: "Python", percent: 80),
      SkillData(name: "Dart", percent: 80),
    ],
    "education_list": [
      EducationData(
        year: "2016-2023",
        name: "Bechalor of Engineering",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
      ),
      EducationData(
        year: "2016-2023",
        name: "Bechalor of Engineering",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
      ),
      EducationData(
        year: "2016-2023",
        name: "Bechalor of Engineering",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
      ),
    ],
  },
  "contact_content": {
    "title": {
      "question": "Want to contact me?",
      "answer": "Don't Hesitate",
    },
    "contact_info": [
      ContactData(icon: Icons.phone, name: "Call Me On", data: "+959250968377"),
      ContactData(icon: Icons.location_on, name: "Country", data: "Myanmar"),
      ContactData(
        icon: Icons.email,
        name: "Mail Me On",
        data: "pyiheintun77@gmail.com",
      ),
      ContactData(
        icon: Icons.telegram,
        name: "Message Me On",
        data: "@leolucard",
      ),
    ],
  },
  "project_content": [
    ProjectData(
      index: 0,
      projectName: "Portfolio Project",
      projectDescription:
          "This Project is demo portfolio project using Flutter.",
      usedTech: [
        "Flutter",
        "Dart",
      ],
      img: "https://i.imgur.com/a36nlnN.png",
      sourceCode: "https://github.com/PyaeHeinTun/PortfolioFlutter",
      demoLink: "https://pyaeheintun.github.io/",
    ),
    ProjectData(
      index: 1,
      projectName: "Book Server",
      projectDescription:
          "This is a simple NodeJS backend server for CRUD operations.",
      usedTech: ["Nodejs", "Javascript"],
      img: "",
      sourceCode: "https://github.com/PyaeHeinTun/book_server_nodejs",
      demoLink: "",
    ),
  ],
  "colors": {
    "background_color": Colors.black,
    "menu_color": const Color.fromARGB(255, 35, 35, 35),
    "text_color": Colors.white,
    "primary_color": const Color.fromARGB(255, 255, 123, 0),
  }
};
