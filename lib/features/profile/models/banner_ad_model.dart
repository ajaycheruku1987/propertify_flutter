// To parse this JSON data, do
//
//     final bannerAdModel = bannerAdModelFromJson(jsonString);

import 'dart:convert';
import 'package:propertify/utils/extensions/date_time_extensions.dart';

BannerAdModel bannerAdModelFromJson(String str) =>
    BannerAdModel.fromJson(json.decode(str));

String bannerAdModelToJson(BannerAdModel data) => json.encode(data.toJson());

class BannerAdModel {
  final double? amount;
  final bool? approved;
  final String? createdAt;
  final String? description;
  final String? expiresAt;
  final String? id;
  final List<String>? imageUrls;
  final bool? isPaid;
  final Owner? owner;
  final int? planDays;
  final String? planName;
  final bool? termsAccepted;
  final String? userId;
  final String? address;
  final int? callCount;
  final int? whatsappCount;

  const BannerAdModel({
    this.amount,
    this.approved,
    this.createdAt,
    this.description,
    this.expiresAt,
    this.id,
    this.imageUrls,
    this.isPaid,
    this.owner,
    this.planDays,
    this.planName,
    this.termsAccepted,
    this.userId,
    this.address,
    this.callCount,
    this.whatsappCount,
  });

  factory BannerAdModel.fromJson(Map<String, dynamic> json) {
    return BannerAdModel(
      amount: (json['amount'] as num?)?.toDouble(),
      approved: json['approved'] as bool?,
      createdAt: json['created_at'] as String?,
      description: json['description'] as String?,
      expiresAt: json['expires_at'] as String?,
      id: json['id'] as String?,
      imageUrls: (json['image_urls'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      isPaid: json['is_paid'] as bool?,
      owner: json['owner'] != null ? Owner.fromJson(json['owner'] as Map<String, dynamic>) : null,
      planDays: json['plan_days'] as int?,
      planName: json['plan_name'] as String?,
      termsAccepted: json['terms_accepted'] as bool?,
      userId: json['user_id'] as String?,
      address: json['address'] as String?,
      callCount: json['call_count'] as int?,
      whatsappCount: json['whatsapp_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'approved': approved,
        'created_at': createdAt,
        'description': description,
        'expires_at': expiresAt,
        'id': id,
        'image_urls': imageUrls,
        'is_paid': isPaid,
        'owner': owner?.toJson(),
        'plan_days': planDays,
        'plan_name': planName,
        'terms_accepted': termsAccepted,
        'user_id': userId,
        'address': address,
        'call_count': callCount,
        'whatsapp_count': whatsappCount,
      };

  bool get isCurrentlyActive {
    if (expiresAt == null || expiresAt!.trim().isEmpty) return true;
    return !expiresAt.isPromotionExpired();
  }

  BannerAdModel copyWith({
    double? amount,
    bool? approved,
    String? createdAt,
    String? description,
    String? expiresAt,
    String? id,
    List<String>? imageUrls,
    bool? isPaid,
    Owner? owner,
    int? planDays,
    String? planName,
    bool? termsAccepted,
    String? userId,
    String? address,
    int? callCount,
    int? whatsappCount,
  }) {
    return BannerAdModel(
      amount: amount ?? this.amount,
      approved: approved ?? this.approved,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      expiresAt: expiresAt ?? this.expiresAt,
      id: id ?? this.id,
      imageUrls: imageUrls ?? this.imageUrls,
      isPaid: isPaid ?? this.isPaid,
      owner: owner ?? this.owner,
      planDays: planDays ?? this.planDays,
      planName: planName ?? this.planName,
      termsAccepted: termsAccepted ?? this.termsAccepted,
      userId: userId ?? this.userId,
      address: address ?? this.address,
      callCount: callCount ?? this.callCount,
      whatsappCount: whatsappCount ?? this.whatsappCount,
    );
  }
}

class Owner {
  final DateTime? dateOfBirth;
  final String? email;
  final String? firstName;
  final String? id;
  final String? lastName;
  final String? phoneNumber;
  final String? profileImage;
  final String? username;

  const Owner({
    this.dateOfBirth,
    this.email,
    this.firstName,
    this.id,
    this.lastName,
    this.phoneNumber,
    this.profileImage,
    this.username,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> mutableJson = Map<String, dynamic>.from(json);
    if (mutableJson['profilepic'] == null) {
      mutableJson['profilepic'] = mutableJson['profile_pic'] ??
          mutableJson['profile_image'] ??
          mutableJson['profileImage'];
    }
    return Owner(
      dateOfBirth: mutableJson['date_of_birth'] != null ? DateTime.tryParse(mutableJson['date_of_birth'].toString()) : null,
      email: mutableJson['email'] as String?,
      firstName: mutableJson['first_name'] as String?,
      id: mutableJson['id'] as String?,
      lastName: mutableJson['last_name'] as String?,
      phoneNumber: mutableJson['phone_number'] as String?,
      profileImage: mutableJson['profilepic'] as String?,
      username: mutableJson['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'date_of_birth': dateOfBirth?.toIso8601String(),
        'email': email,
        'first_name': firstName,
        'id': id,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'profilepic': profileImage,
        'username': username,
      };
}
