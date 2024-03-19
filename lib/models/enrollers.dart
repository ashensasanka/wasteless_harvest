class Enroller {
  final String imageURL;
  final String enrollName;

  Enroller(
      {
        required this.enrollName,
        required this.imageURL});

  //List of Plants data
  static List<Enroller> enrollList = [
    Enroller(
        enrollName: 'Farmer',
        imageURL: 'assets/images/farmer.jpg'),
    Enroller(
        enrollName: 'Buyer',
        imageURL: 'assets/images/selling_cart.jpg'),
    Enroller(
        enrollName: 'Agricultural\nExpert',
        imageURL: 'assets/images/educator.jpg'),
  ];
}
