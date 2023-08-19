import 'package:flutter/material.dart';

class Beginner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction to English'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vocabulary Session',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            VocabularyList(),
            SizedBox(height: 32),
            Text(
              'Lesson content for Introduction to English',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'This is a beginner-level English course to help you learn the basics of the English language and grammar. The course will cover various topics, including greetings, introductions, numbers, and more.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Replace this with the video player implementation or video link
              },
              child: Text('Watch Video Lecture'),
            ),
            SizedBox(height: 32),
            Text(
              'Quiz',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Quiz(),
          ],
        ),
      ),
    );
  }
}

class VocabularyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VocabularyItem(
          word: 'Hello',
          meaning: 'Used as a greeting or to begin a telephone conversation.',
        ),
        VocabularyItem(
          word: 'Goodbye',
          meaning: 'Used as a farewell remark when parting.',
        ),
        VocabularyItem(
          word: 'Thank you',
          meaning: 'Expressing gratitude or appreciation.',
        ),
        VocabularyItem(
          word: 'Please',
          meaning: 'Used to ask for something in a polite way.',
        ),
        // Add more vocabulary items here
      ],
    );
  }
}

class VocabularyItem extends StatelessWidget {
  final String word;
  final String meaning;

  VocabularyItem({required this.word, required this.meaning});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          word,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          meaning,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuizQuestion(
          question: 'What is a common way to greet someone?',
          options: ['Hello', 'Goodbye', 'Thank you', 'Please'],
          correctAnswer: 'Hello',
        ),
        QuizQuestion(
          question: 'Which word is used to express gratitude?',
          options: ['Hello', 'Goodbye', 'Thank you', 'Please'],
          correctAnswer: 'Thank you',
        ),
        // Add more quiz questions here
      ],
    );
  }
}

class QuizQuestion extends StatefulWidget {
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  @override
  _QuizQuestionState createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        ...widget.options.map((option) => RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            )),
        SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            if (selectedOption == widget.correctAnswer) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Correct!'),
                  content: Text('Great job! You answered correctly.'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Incorrect'),
                  content: Text('Sorry, the correct answer is: ${widget.correctAnswer}'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            }
          },
          child: Text('Submit Answer'),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
