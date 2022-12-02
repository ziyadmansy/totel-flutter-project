// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CheckInOutEntity {
  final String from;
  final String until;
  CheckInOutEntity({
    required this.from,
    required this.until,
  });

  CheckInOutEntity copyWith({
    String? from,
    String? until,
  }) {
    return CheckInOutEntity(
      from: from ?? this.from,
      until: until ?? this.until,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from,
      'until': until,
    };
  }

  factory CheckInOutEntity.fromMap(Map<String, dynamic> map) {
    return CheckInOutEntity(
      from: (map['from'] as String).isEmpty ? 'N/A' : map['from'],
      until: (map['until'] as String).isEmpty ? 'N/A' : map['until'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckInOutEntity.fromJson(String source) =>
      CheckInOutEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CheckInOutEntity(from: $from, until: $until)';

  @override
  bool operator ==(covariant CheckInOutEntity other) {
    if (identical(this, other)) return true;

    return other.from == from && other.until == until;
  }

  @override
  int get hashCode => from.hashCode ^ until.hashCode;
}
