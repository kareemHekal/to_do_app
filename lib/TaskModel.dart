

class Taskmodel {
  String Title;
  String SubTitle;
  String id;
  bool isDone;
  int Date;

  Taskmodel(
      {required this.Title,
      required this.SubTitle,
      this.id = '',
      this.isDone = false,
      required this.Date});


  Taskmodel.fromJson(Map<String, dynamic> json)
      : this(
            Title: json['Title'],
            SubTitle: json['SubTitle'],
            Date: json['Date'],
            id: json['id'],
            isDone: json['isDone']);

  Map<String, dynamic> tojson() {
    return {
      "Title": Title,
      "SubTitle": SubTitle,
      "Date": Date,
      "id": id,
      "isDone": isDone
    };
  }


}
