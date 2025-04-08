// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String userId;
  final String username;
  final String name;
  final String bio;
  final String photo;

  UserModel({
    required this.userId,
    required this.username,
    required this.name,
    required this.bio,
    required this.photo,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      userId: data['userId'],
      username: data['username'],
      name: data['name'],
      bio: data['bio'],
      photo: data['photo'],
    );
  }

  @override
  String toString() {
    return 'UserModel(userId: $userId, username: $username, name: $name, bio: $bio, photo: $photo)';
  }
}
