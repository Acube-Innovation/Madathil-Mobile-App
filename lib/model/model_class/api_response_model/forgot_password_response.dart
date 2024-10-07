// class ForgotPasswordResponse {
// String? serverMessages;

// ForgotPasswordResponse({
//   this.serverMessages,
// });

// factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
//     ForgotPasswordResponse(
//       serverMessages: json["_server_messages"],
//     );

// Map<String, dynamic> toJson() => {
//       "_server_messages": serverMessages,
//     };
// }

import 'dart:convert'; // For jsonDecode

class ForgotPasswordResponse {
  List<ServerMessage>? serverMessages;

  ForgotPasswordResponse({
    this.serverMessages,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    // Extract the "_server_messages" field and decode it as needed
    String? serverMessagesString = json["_server_messages"];
    if (serverMessagesString != null) {
      List<dynamic> decodedList = jsonDecode(serverMessagesString);
      List<ServerMessage> parsedMessages = decodedList
          .map((msg) => ServerMessage.fromJson(jsonDecode(msg)))
          .toList();

      return ForgotPasswordResponse(serverMessages: parsedMessages);
    } else {
      return ForgotPasswordResponse(serverMessages: []);
    }
  }

  Map<String, dynamic> toJson() => {
        "_server_messages": serverMessages != null
            ? jsonEncode(serverMessages!.map((msg) => msg.toJson()).toList())
            : null,
      };
}

class ServerMessage {
  String? message;
  String? title;

  ServerMessage({
    this.message,
    this.title,
  });

  factory ServerMessage.fromJson(Map<String, dynamic> json) => ServerMessage(
        message: json["message"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "title": title,
      };
}
