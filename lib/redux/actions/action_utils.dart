import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:vegan_liverpool/utils/log/log.dart';

void thunkActionCatchError(
    String functionName, void Function() dispatchCalls) async {
  try {
    dispatchCalls();
  } catch (e, s) {
    log.error('ERROR - $functionName $e');
    await Sentry.captureException(
      e,
      stackTrace: s,
      hint: 'ERROR - $functionName $e',
    );
  }
  ;
}
