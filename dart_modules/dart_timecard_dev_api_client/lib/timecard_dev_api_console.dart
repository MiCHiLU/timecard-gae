library timecard_dev_api.console;

import "package:google_oauth2_client/google_oauth2_console.dart" as oauth2;

import 'package:timecard_dev_api/src/console_client.dart';

import "package:timecard_dev_api/timecard_dev_api_client.dart";

/** timecard API */
class Timecard extends Client with ConsoleClient {

  /** OAuth Scope2: View your email address */
  static const String USERINFO_EMAIL_SCOPE = "https://www.googleapis.com/auth/userinfo.email";

  final oauth2.OAuth2Console auth;

  Timecard([oauth2.OAuth2Console this.auth]);
}
