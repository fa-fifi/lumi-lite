import 'package:csv/csv.dart';
import 'package:flutter/material.dart';

class CsvService {
  static Future<List<List<dynamic>>> loadCsv(BuildContext context,
      {required String source}) async {
    var result = await DefaultAssetBundle.of(context).loadString(source);

    return const CsvToListConverter().convert(result, eol: "\n");
  }
}
