class ProfileModel {
  String? fullName;
  String? emai;
  String? phoneNumber;
  String? supervisorName;
  String? dateofBirth;
  
  ProfileModel(this.dateofBirth, this.emai, this.fullName, this.phoneNumber, this.supervisorName);

  ProfileModel.fromJson(Map<String, dynamic> json) {
    fullName = json["data"] ["full_name"];
    emai = json["data"] ["email"];
    phoneNumber = json["data"]["mobile_number"];
    supervisorName = json["data"] ["parent_user"] ["full_name"];
    dateofBirth = json["data"] ["dob"];
  }

}