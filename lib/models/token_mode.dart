// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TokenModel {
  final int userId;
  final int employeeId;
  final String employeeNo;
  final String refreshToken;
  final String accessToken;
  final String expiredDt;
  TokenModel({
    required this.userId,
    required this.employeeId,
    required this.employeeNo,
    required this.refreshToken,
    required this.accessToken,
    required this.expiredDt,
  });

  TokenModel copyWith({
    int? userId,
    int? employeeId,
    String? employeeNo,
    String? refreshToken,
    String? accessToken,
    String? expiredDt,
  }) {
    return TokenModel(
      userId: userId ?? this.userId,
      employeeId: employeeId ?? this.employeeId,
      employeeNo: employeeNo ?? this.employeeNo,
      refreshToken: refreshToken ?? this.refreshToken,
      accessToken: accessToken ?? this.accessToken,
      expiredDt: expiredDt ?? this.expiredDt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'employeeId': employeeId,
      'employeeNo': employeeNo,
      'refreshToken': refreshToken,
      'accessToken': accessToken,
      'expiredDt': expiredDt,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      userId: (map['userId'] ?? 0) as int,
      employeeId: (map['employeeId'] ?? 0) as int,
      employeeNo: (map['employeeNo'] ?? '') as String,
      refreshToken: (map['refreshToken'] ?? '') as String,
      accessToken: (map['accessToken'] ?? '') as String,
      expiredDt: (map['expiredDt'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TokenModel(userId: $userId, employeeId: $employeeId, employeeNo: $employeeNo, refreshToken: $refreshToken, accessToken: $accessToken, expiredDt: $expiredDt)';
  }

  @override
  bool operator ==(covariant TokenModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.employeeId == employeeId &&
        other.employeeNo == employeeNo &&
        other.refreshToken == refreshToken &&
        other.accessToken == accessToken &&
        other.expiredDt == expiredDt;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        employeeId.hashCode ^
        employeeNo.hashCode ^
        refreshToken.hashCode ^
        accessToken.hashCode ^
        expiredDt.hashCode;
  }
}
