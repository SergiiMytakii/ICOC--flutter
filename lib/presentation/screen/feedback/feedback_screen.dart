import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/domain/model/feedback/feedback_model.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/feedback_bloc/feedback_bloc.dart';
import 'package:icoc/presentation/screen/feedback/widget/feedback_form.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';
import 'package:icoc/presentation/widget/custom_button.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';
import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance.logScreenView(screenName: 'Feedback');

    getIt<FeedbackBloc>().add(const FeedbackEvent.listRequested());
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BlocBuilder<FeedbackBloc, FeedbackState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => Loading(),
                      getFeedbackListSuccess: (feedbacks) => ListView.builder(
                        cacheExtent: 0,
                        itemCount: feedbacks.length,
                        itemBuilder: (context, index) {
                          return AnimationWrapper(
                            child: _buildFeedbackCard(index, feedbacks),
                          );
                        },
                      ),
                      error: (message) => ErrorTextOnScreen(message: message),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Text field for writing feedback

              const SizedBox(height: 16),
              // Button to submit feedback
              CustomButton(
                onPressed: () {
                  showModalBottomSheet(
                    scrollControlDisabledMaxHeightRatio: 2,
                    context: context,
                    builder: (BuildContext context) {
                      return ModalBottomSheet(
                        height: MediaQuery.of(context).size.height / 1.5,
                        blurBackground: false,
                        child: FeedbackForm(),
                      );
                    },
                  );
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

  Column _buildFeedbackCard(
    int index,
    List<FeedbackModel> feedbacks,
  ) {
    final formattedDate =
        DateFormat('dd.MM\nyyyy').format(DateTime.parse(feedbacks[index].date));
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          titleTextStyle: TextStyle(color: getDividerColor(index)),
          title: Row(
            children: [
              Icon(
                Icons.person,
                color: getDividerColor(index),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(feedbacks[index].name),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(child: Text(feedbacks[index].text)),
                ],
              ),
              if (feedbacks[index].comment != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 28,
                        ),
                        const Icon(
                          Icons.person,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Responce from developer:'.tr(),
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 56,
                        ),
                        Flexible(
                          child: Text(feedbacks[index].comment ?? '',
                              style:
                                  const TextStyle(fontStyle: FontStyle.italic)),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
          leading: SizedBox(
            width: 35,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display day and month on the first line
                  Text(
                    formattedDate.split('\n')[0],
                  ),
                  // Display year on the second line
                  Text(
                    formattedDate.split('\n')[1],
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
    );
  }

  // Method to submit feedback
}
