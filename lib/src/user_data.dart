class UserData {
  late String fullName;
  late String icNumber;
  late String email;
  late String phoneNumber;
  late String gender;

  late String userName;
  late int userUID;

  String getTemuGovID() {
    return "$userName#$userUID";
  }

  late bool hasAgreed = false;
}
