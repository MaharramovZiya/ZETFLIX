class ProfileModel {
  final String name;
  final String img;

  ProfileModel({required this.name, required this.img});
}

List<ProfileModel> profilList = [
  ProfileModel(name: "Emenal", img: 'assets/images/n1.jpg'),
  ProfileModel(name: "Onyeka", img: 'assets/images/n2.jpg'),
  ProfileModel(name: "Thelma", img: 'assets/images/n3.jpg'),
  ProfileModel(name: "Veylma", img: 'assets/images/n4.jpg'),
  ProfileModel(name: "Add", img: 'assets/images/n5.png'),
];
