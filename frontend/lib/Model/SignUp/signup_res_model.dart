class SignUpResModel {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  String? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  double? height;
  double? weight;
  String? eyeColor;
  Hair? hair;
  String? domain;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;

  SignUpResModel({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.domain,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
  });

  factory SignUpResModel.fromJson(Map<String, dynamic> json) => SignUpResModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        maidenName: json['maidenName'],
        age: json['age'],
        gender: json['gender'],
        email: json['email'],
        phone: json['phone'],
        username: json['username'],
        password: json['password'],
        birthDate: json['birthDate'],
        image: json['image'],
        bloodGroup: json['bloodGroup'],
        height: (json['height'] as num?)?.toDouble(),
        weight: (json['weight'] as num?)?.toDouble(),
        eyeColor: json['eyeColor'],
        hair: json['hair'] != null ? Hair.fromJson(json['hair']) : null,
        domain: json['domain'],
        ip: json['ip'],
        address: json['address'] != null ? Address.fromJson(json['address']) : null,
        macAddress: json['macAddress'],
        university: json['university'],
        bank: json['bank'] != null ? Bank.fromJson(json['bank']) : null,
        company: json['company'] != null ? Company.fromJson(json['company']) : null,
        ein: json['ein'],
        ssn: json['ssn'],
        userAgent: json['userAgent'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'maidenName': maidenName,
        'age': age,
        'gender': gender,
        'email': email,
        'phone': phone,
        'username': username,
        'password': password,
        'birthDate': birthDate,
        'image': image,
        'bloodGroup': bloodGroup,
        'height': height,
        'weight': weight,
        'eyeColor': eyeColor,
        'hair': hair?.toJson(),
        'domain': domain,
        'ip': ip,
        'address': address?.toJson(),
        'macAddress': macAddress,
        'university': university,
        'bank': bank?.toJson(),
        'company': company?.toJson(),
        'ein': ein,
        'ssn': ssn,
        'userAgent': userAgent,
      };
}

class Hair {
  String? color;
  String? type;

  Hair({this.color, this.type});

  factory Hair.fromJson(Map<String, dynamic> json) => Hair(
        color: json['color'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'color': color,
        'type': type,
      };
}

class Address {
  String? address;
  String? city;
  Coordinates? coordinates;
  String? postalCode;
  String? state;

  Address({
    this.address,
    this.city,
    this.coordinates,
    this.postalCode,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json['address'],
        city: json['city'],
        coordinates:
            json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : null,
        postalCode: json['postalCode'],
        state: json['state'],
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'city': city,
        'coordinates': coordinates?.toJson(),
        'postalCode': postalCode,
        'state': state,
      };
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: (json['lat'] as num?)?.toDouble(),
        lng: (json['lng'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}

class Bank {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bank({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        cardExpire: json['cardExpire'],
        cardNumber: json['cardNumber'],
        cardType: json['cardType'],
        currency: json['currency'],
        iban: json['iban'],
      );

  Map<String, dynamic> toJson() => {
        'cardExpire': cardExpire,
        'cardNumber': cardNumber,
        'cardType': cardType,
        'currency': currency,
        'iban': iban,
      };
}

class Company {
  Address? address;
  String? department;
  String? name;
  String? title;

  Company({
    this.address,
    this.department,
    this.name,
    this.title,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        address: json['address'] != null ? Address.fromJson(json['address']) : null,
        department: json['department'],
        name: json['name'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'address': address?.toJson(),
        'department': department,
        'name': name,
        'title': title,
      };
}
