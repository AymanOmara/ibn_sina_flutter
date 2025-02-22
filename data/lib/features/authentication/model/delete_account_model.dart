import 'dart:convert';

import 'package:data/network/decode_able.dart';
import 'package:xml/xml.dart';

class DeleteAccountModel implements DecodeAble<DeleteAccountModel?, String> {
  bool? success;

  DeleteAccountModel({
    this.success,
  });

  @override
  DeleteAccountModel? fromJson(String json) {
    final document = XmlDocument.parse(json);

    String jsonString = document.rootElement.innerText;

    dynamic jsonData = jsonDecode(jsonString);
    return DeleteAccountModel(
      success: jsonData
    );
  }
}
