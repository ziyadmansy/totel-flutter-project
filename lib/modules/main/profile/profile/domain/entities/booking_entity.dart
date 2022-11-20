import 'dart:convert';

class BookingEntity {
  final int id;

  BookingEntity({
    required this.id,
  });

  BookingEntity copyWith({
    int? id,
  }) {
    return BookingEntity(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory BookingEntity.fromMap(Map<String, dynamic> map) {
    return BookingEntity(
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingEntity.fromJson(String source) => BookingEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BookingEntity(id: $id)';

  @override
  bool operator ==(covariant BookingEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
