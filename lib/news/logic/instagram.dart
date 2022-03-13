// import '../../index.dart';
// import 'package:http/http.dart' as http;

// class Instagram {
//   /// [clientID], [appSecret], [redirectUri] from your facebook developer basic display panel.
//   /// [scope] choose what kind of data you're wishing to get.
//   /// [responseType] I recommend only 'code', I try on DEV MODE with token, it wasn't working.
//   /// [url] simply the url used to communicate with Instagram API at the beginning.
//   static const String clientID = INSTAGRAM_CLIENT_ID;
//   static const String appSecret = INSTAGRAM_APP_SECRET;
//   static const String redirectUri = INSTAGRAM_REDIRECT_URI;
//   static const String scope = 'user_profile,user_media';
//   static const String responseType = 'code';
//   var accessToken;
//   String? userID = '';
//   String authorizationCode = '';
//   static const String url =
//       'https://api.instagram.com/oauth/authorize?client_id=${clientID}&redirect_uri=${redirectUri}&scope=${scope}&response_type=${responseType}';

//   /// Presets your required fields on each call api.
//   /// Please refers to https://developers.facebook.com/docs/instagram-basic-display-api/reference .
//   List<String> userFields = ['id', 'username'];
//   List<String> mediasListFields = ['id', 'caption'];
//   List<String> mediaFields = [
//     'id',
//     'media_type',
//     'media_url',
//     'username',
//     'timestamp'
//   ];

//   void getAuthorizationCode(String url) {
//     /// Parsing the code from string url.
//     authorizationCode =
//         url.replaceAll('${redirectUri}?code=', '').replaceAll('#_', '');
//   }

//   Future<bool> getTokenAndUserID() async {
//     /// Request token.
//     /// Set token.
//     /// Returning status request as bool.
//     var url1 = Uri.parse("https://api.instagram.com/oauth/access_token");
//     final http.Response response = await http.post(url1, body: {
//       "client_id": clientID,
//       "redirect_uri": redirectUri,
//       "client_secret": appSecret,
//       "code": authorizationCode,
//       "grant_type": "authorization_code"
//     });
//     log.i(json.decode(response.body));
//     accessToken = json.decode(response.body)['access_token'];
//     userID = json.decode(response.body)['user_id'];

//     log.i(accessToken);
//     log.i(userID);
//     return (accessToken != null && userID != null) ? true : false;
//   }

//   Future<bool> getUserProfile() async {
//     /// Parse according fieldsList.
//     /// Request instagram user profile.
//     /// Set profile.
//     /// Returning status request as bool.
//     final String fields = userFields.join(',');
//     var url2 = Uri.parse(
//         'https://graph.instagram.com/${userID}?fields=${fields}&access_token=${accessToken}');
//     final http.Response responseNode = await http.get(url2);
//     var instaProfile = {
//       'id': json.decode(responseNode.body)['id'].toString(),
//       'username': json.decode(responseNode.body)['username'],
//     };

//     return (instaProfile != null) ? true : false;
//   }
// }
