class MyUser {
  String name;
  String phoneNumber;
  String email;
  String imageLink;
  String password;
  List<dynamic> favorites;
  Map<dynamic,dynamic> orderList;
  MyUser({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.imageLink,
    required this.password,
    required this.favorites,
    required this.orderList,
  });

  factory MyUser.fromJson(Map<String, dynamic> json) {
    return MyUser(
      name: json["name"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        imageLink: json["image_link"],
        favorites: json["favorites"],
        orderList: json["orderList"]);
  }
}
