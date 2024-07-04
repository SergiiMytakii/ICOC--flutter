import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/feedback_bloc/feedback_bloc.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';
import 'package:icoc/presentation/widget/custom_back_icon.dart';
import 'package:icoc/presentation/widget/custom_button.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController feedbackController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    FirebaseAnalytics.instance.logScreenView(screenName: 'Feedback');

    getIt<FeedbackBloc>().add(FeedbackListRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'We would love to hear your feedbacks and suggestions!'.tr(),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
          leading: const CustomBackIcon(Routes.HOME),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Short prompt at the top

              Expanded(
                child: BlocBuilder<FeedbackBloc, FeedbackState>(
                  builder: (context, state) {
                    if (state is GetFeedbackListSuccessState) {
                      return ListView.builder(
                        cacheExtent: 0,
                        itemCount: state.feedbacks.length,
                        itemBuilder: (context, index) {
                          return AnimationWrapper(
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  titleTextStyle:
                                      TextStyle(color: getDividerColor(index)),
                                  title:
                                      Text(state.feedbacks[index].name ?? ''),
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
                                  color: getDividerColor(index),
                                  thickness: 1.2,
                                ),
                              ],
                            ),
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
              const SizedBox(height: 16),
              // Text field for writing feedback
              TextField(
                controller: nameController,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  hintText: 'Your name'.tr(),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Text field for writing feedback
              TextField(
                controller: feedbackController,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Write your feedback here...'.tr(),
                  border: const OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              // Button to submit feedback
              CustomButton(
                onPressed: () {
                  submitFeedback();
                },
                child: Text(
                  'Submit Feedback'.tr(),
                  style: const TextStyle(color: Colors.white),
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
    final String feedback = feedbackController.text.trim();
    final String name = nameController.text.trim();
    if (feedback.isNotEmpty) {
      getIt<FeedbackBloc>().add(InsertFeedbackRequested(feedback, name));
      setState(() {
        feedbackController.clear();
        nameController.clear();
      });
    }
  }
}
