class GetMonthAccountsBody {
  final String date;

  GetMonthAccountsBody({
    required this.date,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;

    return data;
  }
}
