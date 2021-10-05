import 'package:food_ordering_app/pages/user_fields.dart';
import 'package:gsheets/gsheets.dart';

class UserSpreadSheetsApi {
  static const _credentials = r''' {
  "type": "service_account",
  "project_id": "employeespreadsheets",
  "private_key_id": "a8dd4b281c65edd584f3ae7215abbb6090c5a8a5",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC4f3F7VPVhFBdb\n8U9PAFQMnbFbf9zl36BLbPT8+1zG7geyF40Z93h/BEjfzhr9/JP6EfxbCvdc0vWx\nVEzQCxnqhfS1KaDmtErwLy6tP/SifSY9UHRo4iUW6LNLtk4KQepQVgEORxi7TRU/\nl7bCXcsuf4yklUN0UHQKg0ABXrnZqF/TVP6qunMTfxmSfIPzx8AhJmhGU0uzQpJS\nEdLaByA/ndQ9lB4NZFVhdJFOCNmd9MHdb87SYr4M9MQsL+6X84klVBg+oKgsZz6v\npPoAQ2MrbBll2IwEi42KPXoYeHxqwzlVEEpqy7xU3ZtJ13fqSQ35Qa2g3gImLgEs\nE5QtGi87AgMBAAECggEAHpqNQW8DUPobMdYiWLFuP7V8sPfRtZPVrA1Dyh8L8beU\nMTd04WTKaQ9V40H1+kGGbknDeXqlM5GOzb51C2F8CAn2YIKqPPqVH6hD7tsYAkgO\nKseIt8kja9xnuVxhL5RlgLPzcuHaOV988dKBr1YNmQXxV2+nA8lApmnFGTUUUQUz\nzVEztebpr8z5o6XemKdDwMfOfSdRxosXsEun1WZuRNlSPIdGAZqy5fqzlyD1Uy17\n2rsIPiRH6lf2oKt0zIwdfgmS8B1U9lFr2aLnM5ZVTBe7t/dgnIYKfYxZYVUgzo1/\nO6sWwyEbj2OtLByk7IdJhmsmO1B5/UOLTpIcjqNPYQKBgQDi4u0vnkjvO77lwb6G\nJyKukALUrA/oubP5SEGkud0MdSD/FNcyTod3DUYjB95HiYCr3tu5FE/TJPRk+ita\nai6fHOrulaUX1/AULuQViu336vS14Aqkg30inhLjNz/J4kULOrLPhL6CUg3Gtose\n0+WDO2eDEBRbOI90eLBxeauICwKBgQDQLBQLcvXqo/OBTNU0ca2/o6ilH7gkyRKt\nll5ReKGeiNHFgK5a5jJEuhxC2psHid9rxyurdlTmduAcTTcCb0K8J/DyO7umeWGR\nVu+8J5YQOa79/Kc/OeBPANKQt6tUgo0ph9YcZEzi9mtnmJnevzSzszc9XsbXtD3e\nM2Ogh04DkQKBgGigmRxSc/POq3Osar3Wokm5o3SLfDKoIHSee5cJFwS9pt+6rppG\nWHXwKx3QbRK0OCAJ/21UDpOiAQnny8JAIQvC/BvV6nIaZF4KWagNjzu6n+qXTJEd\nCcHC/5bETag9rfVFtlu4LVpPmIbAe1tWAAsKg+uOqLSAWrctSMCriQyNAoGBAJkg\n013YoqyHDYf/TJXXSUe+yz8rpfjpL6QhCCBF7B0B58ywa5DR5AhKHp/OzlstP/u3\n9peZ47njl9c5tU1FKoHdn4+QAOjkQLD4kkCFng0xYVfTkfMgT6/NmxZ5BL6VieES\n2pzn6ubI/RinWAhR/iJxoiCypvHk092vT4m1/d0BAoGBAISMGk8v26bDsQ6yJCrx\nqHb/h46hMjrsDe+pfVgwBsZruw5413Ws4p1JI851Of14VdAw/c1PuOwmJ41XXdBq\ni9d0v1/sajpCQrVvENO9CjLMAFK1cyTDpGQBMnEBr3KkUyQlZip7KRa5pODYvdVL\nrJJ+AKLg8SlIhdYGFnvHRH8+\n-----END PRIVATE KEY-----\n",
  "client_email": "employeespreadsheets@employeespreadsheets.iam.gserviceaccount.com",
  "client_id": "109984329107756506656",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/employeespreadsheets%40employeespreadsheets.iam.gserviceaccount.com"
} ''';
  static final _spreadsheetId = '1fN1_oDmB-xFn1uD5rP3IDVuzL-rEl3zW-oEEdaUJEO0';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {} catch (e) {
      print('Init error $e');
    }
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
    _userSheet = await getWorkSheet(spreadsheet, title: 'Employee SpreadSheet');
    final firstRow = UserFields.getFields();
    _userSheet!.values.insertRow(1, firstRow);
  }

  static Future<Worksheet> getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    _userSheet!.values.map.appendRows(rowList);
  }
}
