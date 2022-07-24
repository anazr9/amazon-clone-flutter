// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amazon_clone/models/rating.dart';
import 'package:flutter/foundation.dart';

class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;
  final List<Rating>? rating;
  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
    this.rating,
  });

  Product copyWith({
    String? name,
    String? description,
    double? quantity,
    List<String>? images,
    String? category,
    double? price,
    String? id,
    List<Rating>? rating,
  }) {
    return Product(
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      category: category ?? this.category,
      price: price ?? this.price,
      id: id ?? this.id,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      '_id': id,
      'rating': rating,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as double,
      images: List<String>.from((map['images'] as List<String>)),
      category: map['category'] as String,
      price: map['price'] as double,
      id: map['_id'] != null ? map['id'] as String : null,
      rating: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(name: $name, description: $description, quantity: $quantity, images: $images, category: $category, price: $price, id: $id)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.quantity == quantity &&
        listEquals(other.images, images) &&
        other.category == category &&
        other.price == price &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        quantity.hashCode ^
        images.hashCode ^
        category.hashCode ^
        price.hashCode ^
        id.hashCode;
  }
}
