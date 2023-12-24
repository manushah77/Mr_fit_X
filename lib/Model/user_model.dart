
class UserData {
  int? id;
  String? fullName;
  String? email;
  String? address;
  String? phoneNumber;
  String? dateOfBirth;
  String? gender;
  String? weight;
  String? height;
  String? selectedPackage;
  String? joinDate;
  String? gymTimings;
  String? goalOfJoining;
  String? weightLoss;
  String? paymentStatus;
  String? paymentId;
  String? packageId;
  String? profileImage;
  int? requiredCalories;
  String? status;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserData(
      {this.id,
        this.fullName,
        this.email,
        this.address,
        this.phoneNumber,
        this.dateOfBirth,
        this.gender,
        this.weight,
        this.height,
        this.selectedPackage,
        this.joinDate,
        this.gymTimings,
        this.goalOfJoining,
        this.weightLoss,
        this.paymentStatus,
        this.paymentId,
        this.packageId,
        this.profileImage,
        this.requiredCalories,
        this.status,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    weight = json['weight'];
    height = json['height'];
    selectedPackage = json['selected_package'];
    joinDate = json['join_date'];
    gymTimings = json['gym_timings'];
    goalOfJoining = json['goal_of_joining'];
    weightLoss = json['weight_loss'];
    paymentStatus = json['payment_status'];
    paymentId = json['payment_id'];
    packageId = json['package_id'];
    profileImage = json['profile_image'];
    requiredCalories = json['required_calories'];
    status = json['status'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['selected_package'] = this.selectedPackage;
    data['join_date'] = this.joinDate;
    data['gym_timings'] = this.gymTimings;
    data['goal_of_joining'] = this.goalOfJoining;
    data['weight_loss'] = this.weightLoss;
    data['payment_status'] = this.paymentStatus;
    data['payment_id'] = this.paymentId;
    data['package_id'] = this.packageId;
    data['profile_image'] = this.profileImage;
    data['required_calories'] = this.requiredCalories;
    data['status'] = this.status;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

