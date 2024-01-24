import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/bloc/feedback_bloc/feedback_bloc.dart';
import 'package:icoc/presentation/widget/custom_button.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController feedbackController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    FirebaseAnalytics.instance.logScreenView(screenName: 'Feedback');
    Future.delayed(Duration.zero).then(
        (value) => context.read<FeedbackBloc>().add(FeedbackListRequested()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'We would love to hear your feedbacks and suggestions!'.tr(),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Short prompt at the top

              Expanded(
                child: BlocBuilder<FeedbackBloc, FeedbackState>(
                  builder: (context, state) {
                    if (state is GetFeedbackListSuccessState) {
                      return ListView.builder(
                        itemCount: state.feedbacks.length,
                        itemBuilder: (context, index) {
                          if (i < 4) {
                            i++;
                          } else {
                            i = 0;
                          }
                          return Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                titleTextStyle:
                                    TextStyle(color: dividerColors[i]),
                                title: Text(state.feedbacks[index].name ?? ''),
                                subtitle: Text(state.feedbacks[index].text),
                                leading: SizedBox(
                                  width: 35,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Display day and month on the first line
                                        Text(
                                          state.feedbacks[index].date
                                              .split('\n')[0],
                                        ),
                                        // Display year on the second line
                                        Text(
                                          state.feedbacks[index].date
                                              .split('\n')[1],
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                indent: 50,
                                color: dividerColors[i],
                                thickness: 1.2,
                              ),
                            ],
                          );
                        },
                      );
                    } else if (state is FeedbackLoadingState) {
                      return Loading();
                    } else if (state is FeedbackErrorState) {
                      return ErrorTextOnScreen(message: state.message);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              SizedBox(height: 16),
              // Text field for writing feedback
              TextField(
                controller: nameController,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  hintText: 'Your name'.tr(),
                  border: OutlineInputBorder(),
                ),
                maxLines: 1,
              ),
              SizedBox(height: 16),
              // Text field for writing feedback
              TextField(
                controller: feedbackController,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Write your feedback here...'.tr(),
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16),
              // Button to submit feedback
              CustomButton(
                onPressed: () {
                  submitFeedback();
                },
                child: Text(
                  'Submit Feedback'.tr(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to submit feedback
  void submitFeedback() {
    String feedback = feedbackController.text.trim();
    String name = nameController.text.trim();
    if (feedback.isNotEmpty) {
      context.read<FeedbackBloc>().add(InsertFeedbackRequested(feedback, name));
      setState(() {
        feedbackController.clear();
        nameController.clear();
      });
    }
  }
}
