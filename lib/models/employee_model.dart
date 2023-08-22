class EmployeeModel {
  String? name;
  String? role;
  DateTime? fromDate;
  DateTime? toDate;

  set setName(String name) => this.name = name;
  set setrole(String role) => this.role = role;
  set setFromDate(DateTime? fromDate) => this.fromDate = fromDate;
  set setToDate(DateTime? toDate) => this.toDate = toDate;

  String? get getName => name;
  String? get getRole => role;
  DateTime? get getFromDate => fromDate;
  DateTime? get getToDate => toDate;

  @override
  String toString() {
    return 'name: $name, role: $role, fromDate: $fromDate, toDate: $toDate';
  }
}
