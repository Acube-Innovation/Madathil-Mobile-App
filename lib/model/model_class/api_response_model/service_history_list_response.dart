class ServiceHistoryListResponse {
  List<ServiceHistory>? data;

  ServiceHistoryListResponse({this.data});

  ServiceHistoryListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ServiceHistory>[];
      json['data'].forEach((v) {
        data!.add(ServiceHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceHistory {
  String? name;
  String? customer;
  String? mntcDate;
  String? mntcTime;
  String? completionStatus;
  String? workCompletionStatus;
  String? status;
  String? maintenanceType;

  ServiceHistory({
    this.name,
    this.customer,
    this.mntcDate,
    this.mntcTime,
    this.completionStatus,
    this.workCompletionStatus,
    this.status,
    this.maintenanceType,
  });

  ServiceHistory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    customer = json['customer'];
    mntcDate = json['mntc_date'];
    mntcTime = json['mntc_time'];
    completionStatus = json['completion_status'];
    workCompletionStatus = json['work_completion_status'];
    status = json['status'];
    maintenanceType = json['maintenance_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['customer'] = this.customer;
    data['mntc_date'] = this.mntcDate;
    data['mntc_time'] = this.mntcTime;
    data['completion_status'] = this.completionStatus;
    data['work_completion_status'] = this.workCompletionStatus;
    data['status'] = this.status;
    data['maintenance_type'] = this.maintenanceType;
    return data;
  }
}
