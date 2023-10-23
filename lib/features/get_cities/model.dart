class CitiesData
{
  late final String status,message;
  late final List<CityModel> list;

  CitiesData.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    list = List.from(json['data']).map((e) => CityModel.fromJson(e)).toList();
  }


}

class CityModel
{
  late final String id,name;
  CityModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
  }
}