class KsebBillUploadResponse {
  Message? message;

  KsebBillUploadResponse({
    this.message,
  });

  factory KsebBillUploadResponse.fromJson(Map<String, dynamic> json) =>
      KsebBillUploadResponse(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message!.toJson(),
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
  int? isPrivate;
  int? isHomeFolder;
  int? isAttachmentsFolder;
  int? fileSize;
  String? fileUrl;
  String? folder;
  int? isFolder;
  String? attachedToDoctype;
  String? attachedToName;
  String? contentHash;
  int? uploadedToDropbox;
  int? uploadedToGoogleDrive;
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
    this.isPrivate,
    this.isHomeFolder,
    this.isAttachmentsFolder,
    this.fileSize,
    this.fileUrl,
    this.folder,
    this.isFolder,
    this.attachedToDoctype,
    this.attachedToName,
    this.contentHash,
    this.uploadedToDropbox,
    this.uploadedToGoogleDrive,
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
        isPrivate: json["is_private"],
        isHomeFolder: json["is_home_folder"],
        isAttachmentsFolder: json["is_attachments_folder"],
        fileSize: json["file_size"],
        fileUrl: json["file_url"],
        folder: json["folder"],
        isFolder: json["is_folder"],
        attachedToDoctype: json["attached_to_doctype"],
        attachedToName: json["attached_to_name"],
        contentHash: json["content_hash"],
        uploadedToDropbox: json["uploaded_to_dropbox"],
        uploadedToGoogleDrive: json["uploaded_to_google_drive"],
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
        "is_private": isPrivate,
        "is_home_folder": isHomeFolder,
        "is_attachments_folder": isAttachmentsFolder,
        "file_size": fileSize,
        "file_url": fileUrl,
        "folder": folder,
        "is_folder": isFolder,
        "attached_to_doctype": attachedToDoctype,
        "attached_to_name": attachedToName,
        "content_hash": contentHash,
        "uploaded_to_dropbox": uploadedToDropbox,
        "uploaded_to_google_drive": uploadedToGoogleDrive,
        "doctype": doctype,
      };
}
