// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
  final String id;
  final String description;
  final String? link;
  final String? thumbnail;
  final bool noMedia;
  final bool isVideo;
  final int timestamp;
  final String userId;
  final String username;

  PostModel({
    required this.id,
    required this.description,
    this.link,
    this.thumbnail,
    required this.noMedia,
    required this.isVideo,
    required this.timestamp,
    required this.userId,
    required this.username,
  });

  factory PostModel.fromMap(Map<String, dynamic> data) {
    return PostModel(
      id: data['id'],
      description: data['description'],
      link: data['link'],
      thumbnail: data['thumbnail'],
      noMedia: data['no_media'] == true,
      isVideo: data['video'] == "true",
      timestamp: data['timestamp'],
      userId: data['userId'],
      username: data['username'],
    );
  }

  bool get isImage => !noMedia && !isVideo;
  bool get isVideoPost => !noMedia && isVideo;

  @override
  String toString() {
    return 'PostModel(id: $id, description: $description, link: $link, thumbnail: $thumbnail, noMedia: $noMedia, isVideo: $isVideo, timestamp: $timestamp, userId: $userId, username: $username)';
  }
}
