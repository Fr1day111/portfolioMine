class Skills {
  Skills({required this.title, required this.photoPath});

  final String title;
  final String photoPath;
}

List<Skills> mySkills = [
  Skills(title: 'Flutter', photoPath: '$homePath/flutter.png'),
  Skills(title: 'Firebase', photoPath: '$homePath/firebase.png'),
  Skills(title: 'Dart', photoPath: '$homePath/dart.png'),
  Skills(title: 'Git', photoPath: '$homePath/git.png'),
  Skills(title: 'My Sql', photoPath: '$homePath/mySql.png'),
  Skills(title: 'Python', photoPath: '$homePath/python.png'),
];
String homePath = 'assets/logo';

class Academic {
  Academic({required this.name, required this.degree});

  final String name;
  final String degree;
}

List<Academic> myAcademy = [
  Academic(name: 'Armadi Secondary School', degree: 'SLC'),
  Academic(name: 'Canvas International College', degree: '+2 Science(Physical)'),
  Academic(name: 'Nepal College of Information Technology', degree: 'Bachelor in Computer Engineering'),
];
