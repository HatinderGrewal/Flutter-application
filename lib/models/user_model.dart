class UserModel{

  String name='';
  String email='';
  String phoneNo='';
  String userId='';
  String city='';

  UserModel.empty();

  UserModel.fromJson(Map<String,dynamic> json){
    name = json['username'] ?? '';
    email = json['email'] ?? '';
    phoneNo = json['phone'] ?? '';
    userId = "${json['id'] ?? ''}";
    city = json['address']['city'] ?? '';
  }

  @override
  String toString() {
    return 'UserModel{name: $name, email: $email, phoneNo: $phoneNo, userId: $userId, city: $city}';
  }
}