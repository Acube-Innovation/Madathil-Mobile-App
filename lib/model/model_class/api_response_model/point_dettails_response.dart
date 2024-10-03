class PointDetailsResponse {
  final List<PointDetailsMessage>? message;

  PointDetailsResponse({this.message});

  // Factory method for JSON deserialization
  factory PointDetailsResponse.fromJson(Map<String, dynamic> json) {
    var messageData = json['message'];
    
    // Check if the message is a list or a single map
    List<PointDetailsMessage> messageList = [];
    if (messageData is List) {
      messageList = messageData.map((e) => PointDetailsMessage.fromJson(e)).toList();
    } else if (messageData is Map<String, dynamic>) {
      messageList = [PointDetailsMessage.fromJson(messageData)];
    }

    return PointDetailsResponse(
      message: messageList,
    );
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message?.map((e) => e.toJson()).toList(),
    };
  }
}

class PointDetailsMessage {
  final String? name;
  final String? customerName;
  final String? selectBusiness;
  final String? consumerNumber;
  final String? item;
  final double? projectCost;
  final String? closingDate;
  final double? holderPoints;
  final double? commissionPoints;

  PointDetailsMessage({
    this.name,
    this.customerName,
    this.selectBusiness,
    this.consumerNumber,
    this.item,
    this.projectCost,
    this.closingDate,
    this.holderPoints,
    this.commissionPoints,
  });

  // Factory method for JSON deserialization
  factory PointDetailsMessage.fromJson(Map<String, dynamic> json) {
    return PointDetailsMessage(
      name: json['name'] as String?,
      customerName: json['customer_name'] as String?,
      selectBusiness: json['select_business'] as String?,
      consumerNumber: json['consumer_number'] as String?,
      item: json['item'] as String?,
      projectCost: (json['project_cost'] as num?)?.toDouble(),
      closingDate: json['closing_date'] as String?,
      holderPoints: (json['holder_points'] as num?)?.toDouble(),
      commissionPoints: (json['commission_points'] as num?)?.toDouble(),
    );
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'customer_name': customerName,
      'select_business': selectBusiness,
      'consumer_number': consumerNumber,
      'item': item,
      'project_cost': projectCost,
      'closing_date': closingDate,
      'holder_points': holderPoints,
      'commission_points': commissionPoints,
    };
  }
}
