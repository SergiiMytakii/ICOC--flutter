import '../../../index.dart';

showSnackbar(String title, String message) {
  Get.snackbar(
    '',
    '',
    backgroundColor: Colors.grey.withOpacity(0.6),
    duration: Duration(seconds: 5),
    titleText: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    messageText: Text(message,
        style: TextStyle(
          fontSize: 14,
        ),
        textAlign: TextAlign.center),
  );
}
