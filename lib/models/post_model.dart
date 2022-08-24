class PostModel{

  int userId=-1;
  int id=-1;
  String title='';
  String body='';

  PostModel.empty();

  PostModel.fromJson(Map<String,dynamic> json){
    userId = int.parse('${json['userId'] ?? -1}');
    id = int.parse('${json['id'] ?? -1}');
    title = json['title'] ?? '';
    body = json['body'] ?? '';
  }

  @override
  String toString() {
    return 'PostModel{userId: $userId, id: $id, title: $title, body: $body}';
  }
}