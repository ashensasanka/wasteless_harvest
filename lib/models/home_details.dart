class HomeDetails {
  final String imageURL;
  final String enrollName;

  HomeDetails(
      {
        required this.enrollName,
        required this.imageURL});

  //List of Plants data
  static List<HomeDetails> homeDetails = [
    HomeDetails(
        enrollName: 'Crop\nManagement',
        imageURL: 'assets/images/cropmanagement.jpg'),
    HomeDetails(
        enrollName: 'Market Place',
        imageURL: 'assets/images/market.jpg'),
    HomeDetails(
        enrollName: 'Educational Resources',
        imageURL: 'assets/images/eduresorce.jpg'),
    HomeDetails(
        enrollName: 'Community Forum',
        imageURL: 'assets/images/community.jpg'),
    HomeDetails(
        enrollName: 'Rate & Comment Farmers',
        imageURL: 'assets/images/rateandcomment.jpg'),
    HomeDetails(
        enrollName: 'Reports',
        imageURL: 'assets/images/report.jpg'),
  ];
}
