class UserDetails{
  final String? userName;
  final int? userId;
  UserDetails({this.userName, this.userId});
  factory UserDetails.fromJson(var data) {
    final userName = data["userName"];
    final userId = data["userId"];
    return UserDetails(userId: userId, userName: userName);
}}