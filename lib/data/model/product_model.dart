import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProdectModel {
  String title;
  final price;
  String description;
  String image;
  String category;
  Map<String, dynamic> rating;
  int id;
  ProdectModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.rating,
  });
  factory ProdectModel.fromJson(Map<String, dynamic> datajson) {
    return ProdectModel(
        id: datajson['id'],
        image: datajson['image'],
        title: datajson['title'],
        description: datajson['description'],
        price: datajson['price'],
        category: datajson['category'],
        rating: datajson['rating']);
  }
}
