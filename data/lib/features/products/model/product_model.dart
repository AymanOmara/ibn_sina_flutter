import 'dart:convert';

import 'package:data/network/decode_able.dart';
import 'package:domain/features/products/entity/product_entity.dart';
import 'package:xml/xml.dart';

class Products implements DecodeAble<List<ProductModel?>, String> {
  @override
  List<ProductModel?> fromJson(String json) {
    final document = XmlDocument.parse(json);

    String jsonString = document.rootElement.innerText;

    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((e) => ProductModel().fromJson(e)).toList() ?? [];
  }
}

class ProductModel implements DecodeAble<ProductModel?, Map<String, dynamic>> {
  final int? productID;
  final String? productName;
  final String? productDescription;
  final String? madeIn;
  final String? price;
  final String? amount;
  final String? exDate;
  final String? others;
  final String? firstYear;
  final String? secondYear;
  final String? thirdYear;
  final String? fourthYear;
  final String? fifthYear;
  final String? teeth;
  final String? clothes;
  final String? type;
  final String? discount;
  final String? firstPhoto;
  final String? secondPhoto;
  final String? thirdPhoto;
  final String? fourthPhoto;
  final String? fifthPhoto;
  final String? sixthPhoto;
  final String? size;
  final String? guarantee;

  ProductModel({
    this.productID,
    this.productName,
    this.productDescription,
    this.madeIn,
    this.price,
    this.amount,
    this.exDate,
    this.others,
    this.firstYear,
    this.secondYear,
    this.thirdYear,
    this.fourthYear,
    this.fifthYear,
    this.teeth,
    this.clothes,
    this.type,
    this.discount,
    this.firstPhoto,
    this.secondPhoto,
    this.thirdPhoto,
    this.fourthPhoto,
    this.fifthPhoto,
    this.sixthPhoto,
    this.size,
    this.guarantee,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productID: json['ProductID'] as int?,
      productName: json['ProuductName'] as String?,
      productDescription: json['ProuductDescription'] as String?,
      madeIn: json['MadeIn'] as String?,
      price: json['Price'] as String?,
      amount: json['Amount'] as String?,
      exDate: json['EXDate'] as String?,
      others: json['Others'] as String?,
      firstYear: json['FirstYear'] as String?,
      secondYear: json['SecondYear'] as String?,
      thirdYear: json['ThirdYear'] as String?,
      fourthYear: json['FourthYear'] as String?,
      fifthYear: json['FifthYear'] as String?,
      teeth: json['Teeth'] as String?,
      clothes: json['Clothes'] as String?,
      type: json['Type'] as String?,
      discount: json['Discount'] as String?,
      firstPhoto: json['FirstPhoto'] as String?,
      secondPhoto: json['SecondPhoto'] as String?,
      thirdPhoto: json['ThirdPhoto'] as String?,
      fourthPhoto: json['FourthPhoto'] as String?,
      fifthPhoto: json['FifthPhoto'] as String?,
      sixthPhoto: json['SixthPhoto'] as String?,
      size: json['Size'] as String?,
      guarantee: json['Guarantee'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ProductID': productID,
      'ProuductName': productName,
      'ProuductDescription': productDescription,
      'MadeIn': madeIn,
      'Price': price,
      'Amount': amount,
      'EXDate': exDate,
      'Others': others,
      'FirstYear': firstYear,
      'SecondYear': secondYear,
      'ThirdYear': thirdYear,
      'FourthYear': fourthYear,
      'FifthYear': fifthYear,
      'Teeth': teeth,
      'Clothes': clothes,
      'Type': type,
      'Discount': discount,
      'FirstPhoto': firstPhoto,
      'SecondPhoto': secondPhoto,
      'ThirdPhoto': thirdPhoto,
      'FourthPhoto': fourthPhoto,
      'FifthPhoto': fifthPhoto,
      'SixthPhoto': sixthPhoto,
      'Size': size,
      'Guarantee': guarantee,
    };
  }

  @override
  ProductModel? fromJson(Map<String, dynamic> json) {
    return ProductModel.fromJson(json);
  }

  ProductEntity toEntity() {
    return ProductEntity(
      productId: productID ?? 0, // Default to 0 if null
      productName: productName ?? "Unknown", // Default to "Unknown" if null
      productDescription: productDescription ?? "No Description",
      madeIn: madeIn ?? "Unknown",
      price: price ?? "0.0",
      amount: amount ?? "0",
      exDate: exDate ?? "N/A",
      others: others ?? "N/A",
      firstYear: firstYear ?? "N/A",
      secondYear: secondYear ?? "N/A",
      thirdYear: thirdYear ?? "N/A",
      fourthYear: fourthYear ?? "N/A",
      fifthYear: fifthYear ?? "N/A",
      teeth: teeth ?? "N/A",
      clothes: clothes ?? "N/A",
      type: type ?? "N/A",
      discount: discount ?? "0%",
      images: [
        firstPhoto ?? "",
        secondPhoto ?? "",
        thirdPhoto ?? "",
        fourthPhoto ?? "",
        fifthPhoto ?? "",
        sixthPhoto ?? ""
      ].where((photo) => photo.isNotEmpty).toList(), // Remove empty photo strings
      size: size ?? "Unknown",
      guarantee: guarantee ?? "No Guarantee",
      rate: 0, // Assuming a default rating of 0
    );
  }
}
