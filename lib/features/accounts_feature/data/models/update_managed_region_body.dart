class UpdateManagedRegionsBody {
  final String userId;
 final String regionId;
 final List<String> authorities;

  UpdateManagedRegionsBody(
      {required this.regionId,required this.userId,required this.authorities, });



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['regionId'] = regionId;
    data['userId'] = userId;
    data['authorities'] = authorities;

    return data;
  }
}