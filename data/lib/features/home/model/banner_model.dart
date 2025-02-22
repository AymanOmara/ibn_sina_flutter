import 'dart:convert';

import 'package:data/network/decode_able.dart';
import 'package:xml/xml.dart';

class BannerModel implements DecodeAble<BannerModel?, String> {
  List<String>? urls = [];

  BannerModel({this.urls});

  @override
  BannerModel fromJson(String json) {
    final document = XmlDocument.parse(json);
    final String content = document.rootElement.innerText;

    final List<dynamic> jsonList = jsonDecode(content);
    final List<String> urls = jsonList.cast<String>();

    return BannerModel(urls: urls);
  }
}
