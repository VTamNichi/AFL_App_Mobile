class UserComment {
  String? id;
  String? username;
  String? avatar;
  String? room;
  String? connectionId;
  bool? newGuest;

  UserComment(
      {this.id,
      this.username,
      this.avatar,
      this.room,
      this.connectionId,
      this.newGuest});
      
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['username'] = username;
    data['avatar'] = avatar;
    data['room'] = room;
    data['connectionId'] = connectionId;
    data['newGuest'] = newGuest;
    return data;
  }
}
