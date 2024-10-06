class Department {
  String departmentName;
  String departmentId;

  Department({required this.departmentName, required this.departmentId});

  Department copyWith({String? departmentName, String? departmentId}) {
    return Department(
        departmentName: departmentName ?? this.departmentName,
        departmentId: departmentId ?? this.departmentId);
  }
}
