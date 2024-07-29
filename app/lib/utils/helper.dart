import 'dart:convert';
import 'dart:developer';

void logJSON(Map<String, dynamic> message) {
  log(const JsonEncoder.withIndent('  ').convert(message));
}

String prettyJSON(Map<String, dynamic> message) {
  return const JsonEncoder.withIndent('  ').convert(message);
}
