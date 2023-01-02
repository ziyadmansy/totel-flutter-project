// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CheckDetailsEntity {
  final String from;
  final String to;
  final int is24HourAvailable;
  CheckDetailsEntity({
    required this.from,
    required this.to,
    required this.is24HourAvailable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from,
      'to': to,
      '24_hour_available': is24HourAvailable,
    };
  }

  factory CheckDetailsEntity.fromMap(Map<String, dynamic> map) {
    return CheckDetailsEntity(
      from: (map['from'] as String).isEmpty ? 'N/A' : map['from'],
      to: (map['to'] as String).isEmpty ? 'N/A' : map['to'],
      is24HourAvailable: map['24_hour_available'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckDetailsEntity.fromJson(String source) =>
      CheckDetailsEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CheckDetailsEntity(from: $from, to: $to, is24HourAvailable: $is24HourAvailable)';

  @override
  bool operator ==(covariant CheckDetailsEntity other) {
    if (identical(this, other)) return true;

    return other.from == from &&
        other.to == to &&
        other.is24HourAvailable == is24HourAvailable;
  }

  @override
  int get hashCode => from.hashCode ^ to.hashCode ^ is24HourAvailable.hashCode;
}
