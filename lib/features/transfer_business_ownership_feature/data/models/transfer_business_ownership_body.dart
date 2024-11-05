
class TransferBusinessOwnershipBody {
 final String userId;
 final String businessId;


 TransferBusinessOwnershipBody(
      {required this.userId,required this.businessId, });



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['businessId'] = businessId;

    return data;
  }
}