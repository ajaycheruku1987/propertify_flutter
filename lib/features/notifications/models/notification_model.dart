class NotificationModel {
  final String id;
  final String title;
  final String body;
  final DateTime timestamp;
  final bool isRead;
  final String? type;
  final String? referenceId;
  final String? imageUrl;
  // Raw push payload, used to open the related screen when tapped.
  final Map<String, dynamic>? data;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
    this.type,
    this.referenceId,
    this.imageUrl,
    this.data,
  });

  NotificationModel copyWith({
    String? id,
    String? title,
    String? body,
    DateTime? timestamp,
    bool? isRead,
    String? type,
    String? referenceId,
    String? imageUrl,
    Map<String, dynamic>? data,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      type: type ?? this.type,
      referenceId: referenceId ?? this.referenceId,
      imageUrl: imageUrl ?? this.imageUrl,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
      'type': type,
      'referenceId': referenceId,
      'imageUrl': imageUrl,
      'data': data,
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    final rawBody = json['body'] as String? ?? '';
    final cleanBody = rawBody.contains('__PROPS__')
        ? rawBody.split('__PROPS__').first.trim()
        : rawBody;
    return NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      body: cleanBody,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
      type: json['type'] as String?,
      referenceId: json['referenceId'] as String?,
      imageUrl: json['imageUrl'] as String?,
      data: (json['data'] as Map?)?.cast<String, dynamic>(),
    );
  }

  /// Backend inbox payload (`GET /notifications`) uses snake_case fields.
  factory NotificationModel.fromApi(Map<String, dynamic> json) {
    final rawBody = json['body']?.toString() ?? '';
    final cleanBody = rawBody.contains('__PROPS__')
        ? rawBody.split('__PROPS__').first.trim()
        : rawBody;
    final data = (json['data'] as Map?)?.cast<String, dynamic>();
    final createdAt = json['created_at']?.toString() ??
        json['timestamp']?.toString() ??
        DateTime.now().toIso8601String();
    return NotificationModel(
      id: json['id'].toString(),
      title: json['title']?.toString() ?? '',
      body: cleanBody,
      timestamp: DateTime.tryParse(createdAt) ?? DateTime.now(),
      isRead: json['is_read'] as bool? ?? json['isRead'] as bool? ?? false,
      type: json['type']?.toString(),
      referenceId:
          json['reference_id']?.toString() ?? json['referenceId']?.toString(),
      imageUrl: json['image_url']?.toString() ?? json['imageUrl']?.toString(),
      data: data,
    );
  }

  /// Payload used by [NotificationRouter] for in-app taps.
  /// Builds from stored `data`, filling gaps from `type` + `referenceId`.
  Map<String, dynamic> get routingData {
    final map = <String, dynamic>{
      if (data != null) ...data!,
    };
    final resolvedType = (map['type'] ?? type)?.toString();
    if (resolvedType != null && resolvedType.isNotEmpty) {
      map['type'] = resolvedType;
    }
    final ref = (referenceId ??
            map['property_id'] ??
            map['reel_id'] ??
            map['service_id'] ??
            map['project_id'] ??
            map['reference_id'])
        ?.toString()
        .trim();
    if (ref != null && ref.isNotEmpty) {
      map['reference_id'] = ref;
      switch (resolvedType) {
        case 'new_post':
        case 'like':
        case 'comment':
        case 'view':
        case 'share':
        case 'favourite':
        case 'contact_click':
        case 'property':
          map.putIfAbsent('property_id', () => ref);
          break;
        case 'reel_like':
        case 'reel_comment':
        case 'reel_share':
          map.putIfAbsent('reel_id', () => ref);
          break;
        case 'service_review':
        case 'verification':
          map.putIfAbsent('service_id', () => ref);
          break;
        case 'callback_request':
          map.putIfAbsent('project_id', () => ref);
          break;
      }
    }
    return map;
  }
}
