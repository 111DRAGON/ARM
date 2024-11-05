class GetMyBusinessBody {
  final int pageNumber = 0;
  final int pageSize = 100000000;
  final String searchKeyword;

  GetMyBusinessBody({
    required this.searchKeyword,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['searchKeyword'] = searchKeyword;

    return data;
  }
}
