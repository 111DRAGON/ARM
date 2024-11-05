class GetRegionsMonthAccountsBody {
  final String regionId;
  final String date;

  GetRegionsMonthAccountsBody({
    required this.regionId,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['regionId'] = regionId;
    data['date'] = date;

    return data;
  }
}
