// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DataModel {
  int? id;
  String? employeeNo;
  String? employeeIDCard;
  String? employeeTitleName;
  String? employeeMobileNo;
  String? employeeEmail;
  String? activeStatus;
  String? createdBy;
  String? createdDT;
  DataModel({
    this.id,
    this.employeeNo,
    this.employeeIDCard,
    this.employeeTitleName,
    this.employeeMobileNo,
    this.employeeEmail,
    this.activeStatus,
    this.createdBy,
    this.createdDT,
  });

  DataModel copyWith({
    int? id,
    String? employeeNo,
    String? employeeIDCard,
    String? employeeTitleName,
    String? employeeMobileNo,
    String? employeeEmail,
    String? activeStatus,
    String? createdBy,
    String? createdDT,
  }) {
    return DataModel(
      id: id ?? this.id,
      employeeNo: employeeNo ?? this.employeeNo,
      employeeIDCard: employeeIDCard ?? this.employeeIDCard,
      employeeTitleName: employeeTitleName ?? this.employeeTitleName,
      employeeMobileNo: employeeMobileNo ?? this.employeeMobileNo,
      employeeEmail: employeeEmail ?? this.employeeEmail,
      activeStatus: activeStatus ?? this.activeStatus,
      createdBy: createdBy ?? this.createdBy,
      createdDT: createdDT ?? this.createdDT,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'employeeNo': employeeNo,
      'employeeIDCard': employeeIDCard,
      'employeeTitleName': employeeTitleName,
      'employeeMobileNo': employeeMobileNo,
      'employeeEmail': employeeEmail,
      'activeStatus': activeStatus,
      'createdBy': createdBy,
      'createdDT': createdDT,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'] != null ? map['id'] as int : null,
      employeeNo:
          map['employeeNo'] != null ? map['employeeNo'] as String : null,
      employeeIDCard: map['employeeIDCard'] != null
          ? map['employeeIDCard'] as String
          : null,
      employeeTitleName: map['employeeTitleName'] != null
          ? map['employeeTitleName'] as String
          : null,
      employeeMobileNo: map['employeeMobileNo'] != null
          ? map['employeeMobileNo'] as String
          : null,
      employeeEmail:
          map['employeeEmail'] != null ? map['employeeEmail'] as String : null,
      activeStatus:
          map['activeStatus'] != null ? map['activeStatus'] as String : null,
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : null,
      createdDT: map['createdDT'] != null ? map['createdDT'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DataModel(id: $id, employeeNo: $employeeNo, employeeIDCard: $employeeIDCard, employeeTitleName: $employeeTitleName, employeeMobileNo: $employeeMobileNo, employeeEmail: $employeeEmail, activeStatus: $activeStatus, createdBy: $createdBy, createdDT: $createdDT)';
  }

  @override
  bool operator ==(covariant DataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.employeeNo == employeeNo &&
        other.employeeIDCard == employeeIDCard &&
        other.employeeTitleName == employeeTitleName &&
        other.employeeMobileNo == employeeMobileNo &&
        other.employeeEmail == employeeEmail &&
        other.activeStatus == activeStatus &&
        other.createdBy == createdBy &&
        other.createdDT == createdDT;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        employeeNo.hashCode ^
        employeeIDCard.hashCode ^
        employeeTitleName.hashCode ^
        employeeMobileNo.hashCode ^
        employeeEmail.hashCode ^
        activeStatus.hashCode ^
        createdBy.hashCode ^
        createdDT.hashCode;
  }
}
