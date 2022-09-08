class GetPetModel {
  int? responseCode;
  PetData? data;
  String? message;

  GetPetModel({this.responseCode, this.data, this.message});

  GetPetModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    data = json['data'] != null ? PetData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class PetData {
  String? sId;
  String? user;
  String? name;
  String? gender;
  String? uniqueNo;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Subscription? subscription;
  int? remainingAppointments;

  PetData(
      {this.sId,
      this.user,
      this.name,
      this.gender,
      this.uniqueNo,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.subscription,
      this.remainingAppointments});

  PetData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    name = json['name'];
    gender = json['gender'];
    uniqueNo = json['uniqueNo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    subscription = json['subscription'] != null
        ? new Subscription.fromJson(json['subscription'])
        : null;
    remainingAppointments = json['remainingAppointments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['uniqueNo'] = this.uniqueNo;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.toJson();
    }
    data['remainingAppointments'] = this.remainingAppointments;
    return data;
  }
}

class Subscription {
  String? sId;
  int? appointmentLimit;
  String? user;
  String? planId;
  String? expiryDate;
  String? pet;
  String? transaction;
  int? amount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Subscription(
      {this.sId,
      this.appointmentLimit,
      this.user,
      this.planId,
      this.expiryDate,
      this.pet,
      this.transaction,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Subscription.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    appointmentLimit = json['appointmentLimit'];
    user = json['user'];
    planId = json['planId'];
    expiryDate = json['expiryDate'];
    pet = json['pet'];
    transaction = json['transaction'];
    amount = json['amount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['appointmentLimit'] = this.appointmentLimit;
    data['user'] = this.user;
    data['planId'] = this.planId;
    data['expiryDate'] = this.expiryDate;
    data['pet'] = this.pet;
    data['transaction'] = this.transaction;
    data['amount'] = this.amount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
