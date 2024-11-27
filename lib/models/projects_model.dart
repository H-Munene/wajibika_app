class Project {
  final String name;
  final String location;

  Project({required this.name, required this.location});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      location: json['location'],
    );
  }
}
