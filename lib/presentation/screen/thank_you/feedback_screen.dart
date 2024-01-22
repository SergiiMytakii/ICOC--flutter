import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  List<String> previousFeedbacks = []; // You can replace this with actual data

  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Short prompt at the top
            Text(
              'We would love to hear your feedback!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // List of previous feedbacks
            Expanded(
              child: ListView.builder(
                itemCount: previousFeedbacks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(previousFeedbacks[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            // Text field for writing feedback
            TextField(
              controller: feedbackController,
              decoration: InputDecoration(
                hintText: 'Write your feedback here...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            // Button to submit feedback
            ElevatedButton(
              onPressed: () {
                submitFeedback();
              },
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }

  // Method to submit feedback
  void submitFeedback() {
    String feedback = feedbackController.text.trim();
    if (feedback.isNotEmpty) {
      // You can add your logic here to handle the submitted feedback
      // For now, let's just add it to the list of previous feedbacks
      setState(() {
        previousFeedbacks.add(feedback);
        feedbackController.clear();
      });
    }
  }
}
