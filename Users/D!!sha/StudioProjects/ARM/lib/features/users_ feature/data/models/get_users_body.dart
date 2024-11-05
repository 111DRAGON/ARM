class GetUsersBody {
  final String pageNumber ="0";
  final String pageSize="100000";
  final String regionId="";
  final String enabled="";
  final String locked="";
  final String searchKeyword;

  GetUsersBody({
    required this.searchKeyword,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['regionId'] = regionId;
    data['enabled'] = enabled;
    data['locked'] = locked;
    data['searchKeyword'] =searchKeyword;
    return data;
  }
}
