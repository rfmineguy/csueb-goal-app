import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    if (event.message is! String) return ["Null"];
    return [event.message];
  }
}

Logger createLogger(String className) {
  return Logger(printer: SimpleLogPrinter());
}
