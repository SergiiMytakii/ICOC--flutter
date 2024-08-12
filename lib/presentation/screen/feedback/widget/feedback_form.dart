import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/feedback_bloc/feedback_bloc.dart';
import 'package:icoc/presentation/widget/custom_button.dart';

class FeedbackForm extends StatelessWidget {
  FeedbackForm({super.key});

  final TextEditingController feedbackController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height / 1.6,
      child: Column(
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      hintText: 'Your name'.tr(),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name'.tr();
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Text field for writing feedback
                  TextFormField(
                    controller: feedbackController,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Write your feedback here...'.tr(),
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 12,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your feedback'.tr();
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Button to submit feedback
          CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                submitFeedback(context);
              }
            },
            child: Text(
              'Submit Feedback'.tr(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void submitFeedback(BuildContext context) {
    final String feedback = feedbackController.text.trim();
    final String name = nameController.text.trim();
    if (feedback.isNotEmpty) {
      getIt<FeedbackBloc>()
          .add(FeedbackEvent.insertRequested(feedback: feedback, name: name));
    }
    context.pop();
  }
}
