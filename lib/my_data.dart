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
      SkillData(name: "JS", percent: 70),
      SkillData(name: "Java", percent: 40),
      SkillData(name: "Python", percent: 80),
      SkillData(name: "Dart", percent: 80),
    ],
    "education_list": [
      EducationData(
        year: "2003-2008",
        name: "Primary School of Kawlin",
        description:
            "I started primary school at the age of 5 years and completed basic primary school at the age of 10.",
      ),
      EducationData(
        year: "2008-2014",
        name: "High School of Kawlin",
        description:
            "After completing primary school, I directly joined to high school at the age of 10. In Matriculation Examination, I got total score of 481, with 4 excellent subjects(Maths,Physis,Chemistry,Geography).",
      ),
      EducationData(
        year: "2014-2020",
        name: "Mandalay Technological University",
        description:
            "I have studied Mechatronics Engineering at Mandalay Technological University. Since then, I have interested in programming. At 2020 I am final year student, COVID 19 have started since then i have suspended university.",
      ),
      EducationData(
        year: "2022-2023",
        name: "Mandalay Technological University",
        description:
            "At 2022 Dec, I enrolled again as final year student and graduated at 2023. My graduation thesis title is 'Traffic Sign Detection and Recognition System'. If you are interested i have pushed that code into github.",
      ),
    ],
    "workHistory_list": [
      EducationData(
        year: "25 Apirl 2022",
        name: "Full Stack Developer",
        description:
            "After I have suspended university, i worked as Full Stack Developer for around 6 months. I have used Flutter with dart and NodeJS with Javascript",
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
      projectName: "Crypto Trade Bot",
      projectDescription:
          "I named this bot as BETABOT. I process with the power of Machine Learning. It predict upcomming candles and place position according to the Machine Learning.",
      usedTech: [
        "Python",
        "Pandas",
        "Numpy",
        "Sklearn",
      ],
      img: "",
      sourceCode: "https://github.com/PyaeHeinTun/beta_bot.git",
      demoLink: "https://github.com/PyaeHeinTun/beta_bot.git",
    ),
    ProjectData(
      index: 1,
      projectName: "Book Server",
      projectDescription:
          "This is a simple NodeJS backend server for CRUD operations.",
      usedTech: ["Nodejs", "Javascript"],
      img: "",
      sourceCode: "https://github.com/PyaeHeinTun/book_server_nodejs",
      demoLink: "https://github.com/PyaeHeinTun/book_server_nodejs",
    ),
    ProjectData(
      index: 2,
      projectName: "Traffic Sign Detection and Recognition System",
      projectDescription:
          "This project is my graduation thesis. It extract traffic sign based on Color Detection and recognize with CNN.",
      usedTech: ["Python", "OpenCV"],
      img: "",
      sourceCode: "https://github.com/PyaeHeinTun/traffic_sign_recognition.git",
      demoLink: "https://github.com/PyaeHeinTun/traffic_sign_recognition.git",
    ),
    ProjectData(
      index: 3,
      projectName: "Portfolio App",
      projectDescription:
          "This is portfolio project written in Flutter. Flutter is a cross platform framework, So I can be built for Android,IOS,Linux,Windows and Web.",
      usedTech: ["Flutter", "Dart"],
      img: "",
      sourceCode: "https://github.com/PyaeHeinTun/PortfolioFlutter.git",
      demoLink: "https://github.com/PyaeHeinTun/PortfolioFlutter.git",
    ),
  ],
  "colors": {
    "background_color": Colors.black,
    "menu_color": const Color.fromARGB(255, 35, 35, 35),
    "text_color": Colors.white,
    "primary_color": const Color.fromARGB(255, 255, 123, 0),
  }
};
