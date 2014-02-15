library timecard_main;

@MirrorsUsed(targets: const["timecard"], override: "*")
import "dart:mirrors";

import "package:logging/logging.dart";
import "package:timecard_AngularDart_client/timecard.dart";

main(){
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  startTimecardApp();
}
