import 'dart:convert';

class AssignEmployeeLeadResponse {
  List<EmployeeMessage>? messages;
  List<ServerMessage>? serverMessages;

  AssignEmployeeLeadResponse({this.messages, this.serverMessages});

  AssignEmployeeLeadResponse.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      messages = <EmployeeMessage>[];
      json['message'].forEach((v) {
        messages!.add(EmployeeMessage.fromJson(v));
      });
    }

    // Parse the raw server messages from the JSON string
    if (json['_server_messages'] != null) {
      try {
        List<dynamic> decodedList = jsonDecode(json['_server_messages']);
        serverMessages = decodedList
            .map((msg) => ServerMessage.fromJson(jsonDecode(msg)))
            .toList();
      } catch (e) {
        print('Error parsing server messages: $e');
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (messages != null) {
      data['message'] = messages!.map((v) => v.toJson()).toList();
    }
    if (serverMessages != null) {
      data['_server_messages'] =
          jsonEncode(serverMessages!.map((v) => jsonEncode(v.toJson())).toList());
    }
    return data;
  }
}

class EmployeeMessage {
  String? owner;
  String? name;

  EmployeeMessage({this.owner, this.name});

  EmployeeMessage.fromJson(Map<String, dynamic> json) {
    owner = json['owner'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['owner'] = owner;
    data['name'] = name;
    return data;
  }
}

class ServerMessage {
  String? message;
  String? title;

  ServerMessage({this.message, this.title});

  ServerMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['title'] = title;
    return data;
  }
}
