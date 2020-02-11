
class ListProjects {

  List<Project> listProjects;
  ListProjects({this.listProjects});

  factory ListProjects.fromJson(Map<String, dynamic> json){
    if (json['public_regulated_projects'] != null) {
      var listProjects = json['public_regulated_projects'] as List;
      return ListProjects(
        listProjects: listProjects.map((tagJson) => Project.fromJson(tagJson)).toList(),
      );
    } else {
      return ListProjects(

      );
    }
  }
}

class Project{
  String project_id;
  String project_name;
  String project_timezone;
  Coordinates project_center;
  List<RegulatedSpots> list_regulated_spots;

  Project({this.project_id,this.project_name,this.project_timezone,this.project_center,this.list_regulated_spots});


  factory Project.fromJson(Map<String, dynamic> json){

    if(json['regulated_spots'] != null){
      var listRegulated = json['regulated_spots'] as List;
      return Project(
        project_id: json['project_id'],
        project_name: json['project_name'],
        project_timezone: json['project_timezone'],
        project_center: Coordinates.fromJson(json['project_center']),
        list_regulated_spots: listRegulated.map((tagJson)=> RegulatedSpots.fromJson(tagJson)).toList(),
      );
    } else {
      return Project(
        project_id: json['project_id'],
        project_name: json['project_name'],
        project_timezone: json['project_timezone'],
        project_center: Coordinates.fromJson(json['project_center']),
      );
    }


  }
}

class Coordinates{
  double lat;
  double lon;

  Coordinates({this.lat,this.lon});

  factory Coordinates.fromJson(Map<String, dynamic> json){
    return Coordinates(
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}
class RegulatedSpots{
  int pom_id;
  String name;
  String address;
  int location_type_id;
  Coordinates location;
  propiedades_spot spot_type;
  capacidad occupation;

  RegulatedSpots({this.pom_id,this.name,this.address,this.location_type_id,this.location,this.spot_type,this.occupation});

  factory RegulatedSpots.fromJson(Map<String, dynamic> json){
    return RegulatedSpots(
      pom_id: json['pom_id'],
      name: json['name'],
      address: json['address'],
      location_type_id: json['location_type_id'],
      location: Coordinates.fromJson(json['location']),
      spot_type: propiedades_spot.fromJson(json['spot_type']),
      occupation: capacidad.fromJson(json['occupation']),
    );
  }
}
class propiedades_spot{
  int spot_type_id;
  String name;
  String description;

  propiedades_spot({this.spot_type_id,this.name,this.description});
  factory propiedades_spot.fromJson(Map<String, dynamic> json){
    return propiedades_spot(
      spot_type_id: json['spot_type_id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
class capacidad {
  int max_capacity;

  capacidad({this.max_capacity});
  factory capacidad.fromJson(Map<String, dynamic> json){
    return capacidad(
      max_capacity: json['max_capacity'],
    );
  }
}
