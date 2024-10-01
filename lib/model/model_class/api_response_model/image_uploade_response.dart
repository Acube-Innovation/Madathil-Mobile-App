class ImageUploadeResponse {
  Message? message;

  ImageUploadeResponse({
    this.message,
  });

  factory ImageUploadeResponse.fromJson(Map<String, dynamic> json) =>
      ImageUploadeResponse(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message?.toJson(),
      };
}

class Message {
  String? name;
  String? owner;
  DateTime? creation;
  DateTime? modified;
  String? modifiedBy;
  int? idx;
  int? docstatus;
  String? fileName;
  int? fileSize;
  String? fileUrl;
  String? folder;
  String? doctype;

  Message({
    this.name,
    this.owner,
    this.creation,
    this.modified,
    this.modifiedBy,
    this.idx,
    this.docstatus,
    this.fileName,
    this.fileSize,
    this.fileUrl,
    this.folder,
    this.doctype,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        name: json["name"],
        owner: json["owner"],
        creation: DateTime.parse(json["creation"]),
        modified: DateTime.parse(json["modified"]),
        modifiedBy: json["modified_by"],
        idx: json["idx"],
        docstatus: json["docstatus"],
        fileName: json["file_name"],
        fileSize: json["file_size"],
        fileUrl: json["file_url"],
        folder: json["folder"],
        doctype: json["doctype"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation?.toIso8601String(),
        "modified": modified?.toIso8601String(),
        "modified_by": modifiedBy,
        "idx": idx,
        "docstatus": docstatus,
        "file_name": fileName,
        "file_size": fileSize,
        "file_url": fileUrl,
        "folder": folder,
        "doctype": doctype,
      };
}
