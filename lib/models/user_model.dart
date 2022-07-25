
class User {
  String uid;
  String phoneNumber;
  String email;
  String imageLink;
  List<int> favorites;
  List<Map<int, int>> orderList;
  User({
    required this.uid,
    required this.phoneNumber,
    required this.email,
    required this.imageLink,
    required this.favorites,
    required this.orderList,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        uid: json["uid"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        imageLink: json["image_link"],
        favorites: json["favorites"],
        orderList: json["orderList"]);
  }
}
