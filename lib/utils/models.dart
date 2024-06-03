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
  Skills(title: 'C', photoPath: '$homePath/C.png'),
  Skills(title: 'C++', photoPath: '$homePath/C++.png'),
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
  Academic(name: 'Our Freelancer Community', degree: 'Flutter Developer(Dec 2023 - Present)'),
];

class Project{
  Project({required this.name,required this.detail,required this.photoPath,required this.link});

  final String name;
  final String detail;
  final String photoPath;
  final String link;
}
List<Project> projects =[
  Project(name: 'Our FreeLancer Community', photoPath:'assets/logo/our_freelancer_community.webp',detail: 'Website using Flutter \nPortfolio Website for the OurFreelancerCommunity \nResponsive Design and Proper State Management using Riverpod',link: 'https://ourfreelancercommunity.com/'),
  Project(name: 'Scheduler', photoPath:'assets/logo/scheduler_app_logo.png',detail: 'MobileApp using Flutter \nAvailable in Play Store \nProper MVC Structure \nRiverpod, Local Notification and Sqflite',link: 'https://play.google.com/store/apps/details?id=com.fr1day.scheduleapp&pcampaignid=web_share'),
  Project(name: 'Hikeyy', photoPath:'assets/logo/Hikey.png',detail: 'MobileApp using Flutter \nImplemented simple authentication and functions to organise \nhiking plans with friends and track them\nFirebase, Google Map Api, Local Notification, and other libraries',link:'https://github.com/Fr1day111/FinalYearProject.git'),
  Project(name: 'FreeL', photoPath:'assets/logo/FreeL.png',detail: 'MobileApp using Flutter \nSimpleAuthentication and added ability to add the job \nwith description and request for posted jobs',link: 'https://github.com/Fr1day111/FreeLwithKhalti.git'),
];