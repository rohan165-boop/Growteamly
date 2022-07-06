class DailyupdateModel {
 int? id;
 int? userId;
 String? title;
 String? description;
 int? projectId;
 String? acknowledget;


 DailyupdateModel(
   this.id,
   this.userId,
   this.title,
   this.description,
   this.projectId,
   this.acknowledget
   );
  
  DailyupdateModel.fromJson(Map<String, dynamic> json) {
    id = json[ 'id'];
    userId = json["user_id"];
    title = json["title"];
    description = json["description"];
    projectId = json["project_id"];
    acknowledget = json["acknowledge_at"];

  }

}