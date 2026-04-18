class ReelResponseModel {
  final String? description;
  final List<String>? category;
  final String? location;
  final double? latitude;
  final double? longitude;
  final bool? isPromoted;
  final String? promotedUntil;
  final String? id;
  final String? userId;
  final String? videoUrl;
  final String? createdAt;
  final String? updatedAt;
  final Owner? owner;
  final bool? isLiked;
  final int? likesCount;
  final int? commentsCount;
  final int? viewsCount;

  ReelResponseModel({
    this.description,
    this.category,
    this.location,
    this.latitude,
    this.longitude,
    this.isPromoted,
    this.promotedUntil,
    this.id,
    this.userId,
    this.videoUrl,
    this.createdAt,
    this.updatedAt,
    this.owner,
    this.isLiked,
    this.likesCount,
    this.commentsCount,
    this.viewsCount,
  });

  factory ReelResponseModel.fromJson(Map<String, dynamic> json) {
    return ReelResponseModel(
      description: json['description'],
      category: json['category'] != null
          ? List<String>.from(json['category'])
          : null,
      location: json['location'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      isPromoted: json['is_promoted'],
      promotedUntil: json['promoted_until'],
      id: json['id'],
      userId: json['user_id'],
      videoUrl: json['video_url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
      isLiked: json['is_liked'],
      likesCount: json['likes_count'],
      commentsCount: json['comments_count'],
      viewsCount: json['views_count'],
    );
  }

  ReelResponseModel copyWith({
    String? description,
    List<String>? category,
    String? location,
    double? latitude,
    double? longitude,
    bool? isPromoted,
    String? promotedUntil,
    String? id,
    String? userId,
    String? videoUrl,
    String? createdAt,
    String? updatedAt,
    Owner? owner,
    bool? isLiked,
    int? likesCount,
    int? commentsCount,
    int? viewsCount,
  }) {
    return ReelResponseModel(
      description: description ?? this.description,
      category: category ?? this.category,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isPromoted: isPromoted ?? this.isPromoted,
      promotedUntil: promotedUntil ?? this.promotedUntil,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      videoUrl: videoUrl ?? this.videoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      owner: owner ?? this.owner,
      isLiked: isLiked ?? this.isLiked,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      viewsCount: viewsCount ?? this.viewsCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'is_promoted': isPromoted,
      'promoted_until': promotedUntil,
      'id': id,
      'user_id': userId,
      'video_url': videoUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'owner': owner?.toJson(),
      'is_liked': isLiked,
      'likes_count': likesCount,
      'comments_count': commentsCount,
      'views_count': viewsCount,
    };
  }
}

class Owner {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? dateOfBirth;
  final String? username;
  final String? profilepic;

  Owner({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.username,
    this.profilepic,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      dateOfBirth: json['date_of_birth'],
      username: json['username'],
      profilepic: json['profilepic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'date_of_birth': dateOfBirth,
      'username': username,
      'profilepic': profilepic,
    };
  }
}
