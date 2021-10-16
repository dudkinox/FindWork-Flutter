class Recommended {
  final String title, subtitle, renumeration, image, text1, text2, text3;

  const Recommended(
      {this.title,
      this.subtitle,
      this.renumeration,
      this.image,
      this.text1,
      this.text2,
      this.text3});
}

List<Recommended> demoRecommend = [
  Recommended(
      title: 'Mobile Developer',
      subtitle: 'Flutter',
      renumeration: '\$5000 / anum',
      image: 'assets/images/flutter.png',
      text1: 'Full Time',
      text2: 'Remote',
      text3: 'Senior'),
  Recommended(
      title: 'IOS Developer',
      subtitle: 'Swift',
      renumeration: '\$3000 / anum',
      image: 'assets/images/swift.png',
      text1: 'Full Time',
      text2: 'Remote',
      text3: 'Junior'),
];
