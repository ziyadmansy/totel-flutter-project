// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cheffy/Utils/Utils.dart';

class NotificationEntity {
  final int id;
  final String body;
  final String action;
  final bool isGeneral;
  final DateTime? createdAt;

  NotificationEntity({
    required this.id,
    required this.body,
    required this.action,
    required this.isGeneral,
    required this.createdAt,
  });

  NotificationEntity copyWith({
    int? id,
    String? body,
    String? action,
    bool? isGeneral,
    DateTime? createdAt,
  }) {
    return NotificationEntity(
      id: id ?? this.id,
      body: body ?? this.body,
      action: action ?? this.action,
      isGeneral: isGeneral ?? this.isGeneral,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'body': body,
      'action': action,
      'isGeneral': isGeneral,
      'createdAt': createdAt,
    };
  }

  factory NotificationEntity.fromMap(Map<String, dynamic> map) {
    return NotificationEntity(
      id: map['id'] as int,
      body: map['body'] as String,
      action: map['action'] as String,
      isGeneral: map['is_general'] as bool,
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationEntity.fromJson(String source) =>
      NotificationEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationEntity(id: $id, body: $body, action: $action, isGeneral: $isGeneral, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant NotificationEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.body == body &&
        other.action == action &&
        other.isGeneral == isGeneral &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        body.hashCode ^
        action.hashCode ^
        isGeneral.hashCode ^
        createdAt.hashCode;
  }
}
