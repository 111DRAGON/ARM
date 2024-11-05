
class GetActivationBusinessDataModel {
 final int id;
 final String name;
 final String description;
 final String address;
 final String series;
 final String creationDate;
 final Location location;
 final Owner owner;
 final String regionName;
 final List<String> numbers;
 final List<SubCategories> subCategories;
 final List<String> keywords;
 final List<Links> links;
 final String logo;
 final  List<String> pictures;

  GetActivationBusinessDataModel(
      {required this.id,
        required this.name,
        required this.description,
        required   this.address,
        required   this.series,
        required  this.creationDate,
        required this.location,
        required  this.owner,
        required  this.regionName,
        required  this.numbers,
        required   this.subCategories,
        required   this.keywords,
        required  this.links,
        required  this.logo,
        required  this.pictures,});

 factory GetActivationBusinessDataModel.fromJson(Map<String, dynamic> json) { return GetActivationBusinessDataModel(id:  json['id'], name:  json['name'], description: json['description'], address: json['address'], series: json['series'], creationDate: json['creationDate'], location: Location.fromJson(json['location']), owner: Owner.fromJson(json['owner']), regionName: json['region']['name'], numbers: json['numbers'].cast<String>(),
     subCategories: List.from( json['subCategories'] as List)
     .map((e) => SubCategories.fromJson(e))
     .toList(), keywords: json['keywords'].cast<String>(), links: List.from( json['links'] as List)
         .map((e) => Links.fromJson(e))
         .toList(), logo: json['logo'], pictures: json['pictures'].cast<String>(),);
    
  }
  
}

class Location {
 final double latitude;
 final double longitude;

  Location({required this.latitude, required this.longitude});

 factory Location.fromJson(Map<String, dynamic> json) {return Location(latitude: json['latitude'], longitude: json['longitude']);

  }

  
}

class Owner {
 final int id;
 final String firstName;
 final String lastName;
 final String phoneNumber;
 final String registrationDate;

  Owner(
      {required this.id,
        required this.firstName,
        required this.lastName,
        required this.phoneNumber,
        required this.registrationDate});

factory Owner.fromJson(Map<String, dynamic> json) { return Owner(id: json['id'], firstName: json['firstName'], lastName: json['lastName'], phoneNumber: json['phoneNumber'], registrationDate: json['registrationDate']);

  }

}







class SubCategories {
 final  int id;
 final  String name;

  SubCategories({required this.id,required this.name,});

 factory SubCategories.fromJson(Map<String, dynamic> json) { return SubCategories(id: json['id'], name:  json['name'],);
    
  }


}

class Links {
  final String type;
  final  String link;

  Links({required this.type,required this.link});

 factory Links.fromJson(Map<String, dynamic> json) { return Links(type: json['type'], link: json['link'],);
   
  }


}