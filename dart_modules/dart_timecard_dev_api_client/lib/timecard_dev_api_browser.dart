library timecard_dev_api.browser;

import "package:google_oauth2_client/google_oauth2_browser.dart" as oauth;

import 'package:timecard_dev_api/src/browser_client.dart';
import "package:timecard_dev_api/timecard_dev_api_client.dart";

/** timecard API */
class Timecard extends Client with BrowserClient {

  /** OAuth Scope2: View your email address */
  static const String USERINFO_EMAIL_SCOPE = "https://www.googleapis.com/auth/userinfo.email";

  final oauth.OAuth2 auth;

  Timecard([oauth.OAuth2 this.auth]);
}
