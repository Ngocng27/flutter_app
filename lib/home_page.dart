import 'package:flutter/material.dart';
import 'package:flutter_app/translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Beginner.dart';
import 'Intermediate.dart';
import 'advance.dart';

class EnglishLesson {
  final String title;
  final String level;
  final String description;
  final Widget lessonPage;

  EnglishLesson({
    required this.title,
    required this.level,
    required this.description,
    required this.lessonPage,
  });
}

class MyApp extends StatelessWidget {
  final List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
    Locale('ja', 'JP'),
    Locale('vi', 'VN'),
    Locale('es', 'ES'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Teaching App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: supportedLocales,
      localizationsDelegates: [
        // ... Add your localization delegates here ...
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<EnglishLesson> lessons = [
    EnglishLesson(
      title: 'Introduction to English',
      level: 'Beginner',
      description: 'Learn the basics of the English language and grammar.',
      lessonPage: Beginner(),
    ),
    EnglishLesson(
      title: 'Intermediate English',
      level: 'Intermediate',
      description: 'Improve your English language skills and vocabulary.',
      lessonPage: Intermediate(),
    ),
    EnglishLesson(
      title: 'Advanced English',
      level: 'Advanced',
      description: 'Master advanced English language techniques.',
      lessonPage: Advance(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Teaching App'),
      ),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          return EnglishLessonCard(
            lesson: lessons[index],
          );
        },
      ),
    );
  }
}

class EnglishLessonCard extends StatelessWidget {
  final EnglishLesson lesson;

  EnglishLessonCard({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lesson.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Level: ${lesson.level}',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Text(lesson.description),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => lesson.lessonPage),
                );
              },
              child: Text('Start Lesson'),
            ),
          ],
        ),
      ),
    );
  }
}
