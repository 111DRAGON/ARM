class GetPendingApprovalBody {
  final int pageNumber = 0;
  final int pageSize = 100000000;
  final String searchKeyword="";
  final String regionId;

  GetPendingApprovalBody({

    required this.regionId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNumber'] =pageNumber;
    data['pageSize'] = pageSize;
    data['regionId'] = regionId;
    data['searchKeyword'] = "";

    return data;
  }
}
