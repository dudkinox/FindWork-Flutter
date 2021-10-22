import 'package:login_ui/ScreensAddjob/modelsAddjob/job.dart';

import 'src/model/choice_item.dart';

List<S2Choice<String>> days = [
  S2Choice<String>(value: 'mon', title: 'Monday'),
  S2Choice<String>(value: 'tue', title: 'Tuesday'),
  S2Choice<String>(value: 'wed', title: 'Wednesday'),
  S2Choice<String>(value: 'thu', title: 'Thursday'),
  S2Choice<String>(value: 'fri', title: 'Friday'),
  S2Choice<String>(value: 'sat', title: 'Saturday'),
  S2Choice<String>(value: 'sun', title: 'Sunday'),
];

List<S2Choice<String>> months = [
  S2Choice<String>(value: 'jan', title: 'January'),
  S2Choice<String>(value: 'feb', title: 'February'),
  S2Choice<String>(value: 'mar', title: 'March'),
  S2Choice<String>(value: 'apr', title: 'April'),
  S2Choice<String>(value: 'may', title: 'May'),
  S2Choice<String>(value: 'jun', title: 'June'),
  S2Choice<String>(value: 'jul', title: 'July'),
  S2Choice<String>(value: 'aug', title: 'August'),
  S2Choice<String>(value: 'sep', title: 'September'),
  S2Choice<String>(value: 'oct', title: 'October'),
  S2Choice<String>(value: 'nov', title: 'November'),
  S2Choice<String>(value: 'dec', title: 'December'),
];

List<S2Choice<String>> os = [
  S2Choice<String>(value: 'and', title: 'Android'),
  S2Choice<String>(value: 'ios', title: 'IOS'),
  S2Choice<String>(value: 'mac', title: 'Macintos'),
  S2Choice<String>(value: 'tux', title: 'Linux'),
  S2Choice<String>(value: 'win', title: 'Windows'),
];

List<S2Choice<String>> heroes = [
  S2Choice<String>(value: 'bat', title: 'Batman'),
  S2Choice<String>(value: 'sup', title: 'Superman'),
  S2Choice<String>(value: 'hul', title: 'Hulk'),
  S2Choice<String>(value: 'spi', title: 'Spiderman'),
  S2Choice<String>(value: 'iro', title: 'Ironman'),
  S2Choice<String>(value: 'won', title: 'Wonder Woman'),
];

List<S2Choice<String>> fruits = [
  S2Choice<String>(value: 'app', title: 'Apple'),
  S2Choice<String>(value: 'ore', title: 'Orange'),
  S2Choice<String>(value: 'mel', title: 'Melon'),
];

List<S2Choice<String>> frameworks = [
  S2Choice<String>(value: 'ion', title: 'Ionic'),
  S2Choice<String>(value: 'flu', title: 'Flutter'),
  S2Choice<String>(value: 'rea', title: 'React Native'),
];

List<S2Choice<String>> categories = [
  S2Choice<String>(value: 'ele', title: 'Electronics'),
  S2Choice<String>(value: 'aud', title: 'Audio & Video'),
  S2Choice<String>(value: 'acc', title: 'Accessories'),
  S2Choice<String>(value: 'ind', title: 'Industrial'),
  S2Choice<String>(value: 'wat', title: 'Smartwatch'),
  S2Choice<String>(value: 'sci', title: 'Scientific'),
  S2Choice<String>(value: 'mea', title: 'Measurement'),
  S2Choice<String>(value: 'pho', title: 'Smartphone'),
];

List<S2Choice<String>> sorts = [
  S2Choice<String>(value: 'popular', title: 'Popular'),
  S2Choice<String>(value: 'review', title: 'Most Reviews'),
  S2Choice<String>(value: 'latest', title: 'Newest'),
  S2Choice<String>(value: 'cheaper', title: 'Low Price'),
  S2Choice<String>(value: 'pricey', title: 'High Price'),
];

List<Map<String, dynamic>> cars = [
  {'value': 'bmw-x1', 'title': 'BMW X1', 'brand': 'BMW', 'body': 'SUV'},
  {'value': 'bmw-x7', 'title': 'BMW X7', 'brand': 'BMW', 'body': 'SUV'},
  {'value': 'bmw-x2', 'title': 'BMW X2', 'brand': 'BMW', 'body': 'SUV'},
  {'value': 'bmw-x4', 'title': 'BMW X4', 'brand': 'BMW', 'body': 'SUV'},
  {
    'value': 'honda-crv',
    'title': 'Honda C-RV',
    'brand': 'Honda',
    'body': 'SUV'
  },
  {
    'value': 'honda-hrv',
    'title': 'Honda H-RV',
    'brand': 'Honda',
    'body': 'SUV'
  },
  {
    'value': 'mercedes-gcl',
    'title': 'Mercedes-Benz G-class',
    'brand': 'Mercedes',
    'body': 'SUV'
  },
  {
    'value': 'mercedes-gle',
    'title': 'Mercedes-Benz GLE',
    'brand': 'Mercedes',
    'body': 'SUV'
  },
  {
    'value': 'mercedes-ecq',
    'title': 'Mercedes-Benz ECQ',
    'brand': 'Mercedes',
    'body': 'SUV'
  },
  {
    'value': 'mercedes-glcc',
    'title': 'Mercedes-Benz GLC Coupe',
    'brand': 'Mercedes',
    'body': 'SUV'
  },
  {
    'value': 'lr-ds',
    'title': 'Land Rover Discovery Sport',
    'brand': 'Land Rover',
    'body': 'SUV'
  },
  {
    'value': 'lr-rre',
    'title': 'Land Rover Range Rover Evoque',
    'brand': 'Land Rover',
    'body': 'SUV'
  },
  {
    'value': 'honda-jazz',
    'title': 'Honda Jazz',
    'brand': 'Honda',
    'body': 'Hatchback'
  },
  {
    'value': 'honda-civic',
    'title': 'Honda Civic',
    'brand': 'Honda',
    'body': 'Hatchback'
  },
  {
    'value': 'mercedes-ac',
    'title': 'Mercedes-Benz A-class',
    'brand': 'Mercedes',
    'body': 'Hatchback'
  },
  {
    'value': 'hyundai-i30f',
    'title': 'Hyundai i30 Fastback',
    'brand': 'Hyundai',
    'body': 'Hatchback'
  },
  {
    'value': 'hyundai-kona',
    'title': 'Hyundai Kona Electric',
    'brand': 'Hyundai',
    'body': 'Hatchback'
  },
  {
    'value': 'hyundai-i10',
    'title': 'Hyundai i10',
    'brand': 'Hyundai',
    'body': 'Hatchback'
  },
  {'value': 'bmw-i3', 'title': 'BMW i3', 'brand': 'BMW', 'body': 'Hatchback'},
  {
    'value': 'bmw-sgc',
    'title': 'BMW 4-serie Gran Coupe',
    'brand': 'BMW',
    'body': 'Hatchback'
  },
  {
    'value': 'bmw-sgt',
    'title': 'BMW 6-serie GT',
    'brand': 'BMW',
    'body': 'Hatchback'
  },
  {
    'value': 'audi-a5s',
    'title': 'Audi A5 Sportback',
    'brand': 'Audi',
    'body': 'Hatchback'
  },
  {
    'value': 'audi-rs3s',
    'title': 'Audi RS3 Sportback',
    'brand': 'Audi',
    'body': 'Hatchback'
  },
  {
    'value': 'audi-ttc',
    'title': 'Audi TT Coupe',
    'brand': 'Audi',
    'body': 'Coupe'
  },
  {
    'value': 'audi-r8c',
    'title': 'Audi R8 Coupe',
    'brand': 'Audi',
    'body': 'Coupe'
  },
  {
    'value': 'mclaren-570gt',
    'title': 'Mclaren 570GT',
    'brand': 'Mclaren',
    'body': 'Coupe'
  },
  {
    'value': 'mclaren-570s',
    'title': 'Mclaren 570S Spider',
    'brand': 'Mclaren',
    'body': 'Coupe'
  },
  {
    'value': 'mclaren-720s',
    'title': 'Mclaren 720S',
    'brand': 'Mclaren',
    'body': 'Coupe'
  },
];

List<Map<String, dynamic>> smartphones = [
  {
    'id': 'sk3',
    'name': 'พนักงานขาย',
    'brand': 'Samsung',
    'category': 'Budget Phone'
  },
  {
    'id': 'n106',
    'name': 'งานช่างเทคนิค',
    'brand': 'Nokia',
    'category': 'Budget Phone'
  },
  {
    'id': 'n150',
    'name': 'งานผลิต',
    'brand': 'Nokia',
    'category': 'Budget Phone'
  },
  {
    'id': 'r7a',
    'name': 'งานบริการลูกค้า',
    'brand': 'Xiaomi',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ga10s',
    'name': 'งานบัญชี / การเงิน',
    'brand': 'Samsung',
    'category': 'Mid End Phone'
  },
  {
    'id': 'rn7',
    'name': ' งานบริการลูกค้า',
    'brand': 'Xiaomi',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ga20s',
    'name': 'หัวหน้าเซฟ',
    'brand': 'Samsung',
    'category': 'Mid End Phone'
  },
  {
    'id': 'mc9',
    'name': 'ผู้จัดการ',
    'brand': 'Meizu',
    'category': 'Mid End Phone'
  },
  {
    'id': 'm6',
    'name': 'กราฟฟิกดีไซเนอร์',
    'brand': 'Meizu',
    'category': 'Mid End Phone'
  },
  {
    'id': 'ga2c',
    'name': 'ช่างยนต์',
    'brand': 'Samsung',
    'category': 'Mid End Phone'
  },
  {
    'id': 'r6a',
    'name': 'ช่างไฟฟ้า',
    'brand': 'Xiaomi',
    'category': 'Mid End Phone'
  },
];

// List<Map<String, dynamic>> transports = [
//   {
//     'title': 'Plane',
//     'image': 'https://source.unsplash.com/Eu1xLlWuTWY/100x100',
//   },
//   {
//     'title': 'Train',
//     'image': 'https://source.unsplash.com/Njq3Nz6-5rQ/100x100',
//   },
//   {
//     'title': 'Bus',
//     'image': 'https://source.unsplash.com/qoXgaF27zBc/100x100',
//   },
//   {
//     'title': 'Car',
//     'image': 'https://source.unsplash.com/p7tai9P7H-s/100x100',
//   },
//   {
//     'title': 'Bike',
//     'image': 'https://source.unsplash.com/2LTMNCN4nEg/100x100',
//   },
// ];

List<JobsDetail> demoFeatured = [
  JobsDetail(
      image: 'assets/images/youtube.png',
      title: 'Backend Developer',
      subTitle: 'Youtube',
      renumeration: '\฿2000 / บาท',
      datePosted: '3 Weeks ago',
      text1: 'Part Time',
      text2: 'Remote',
      text3: 'Junior',
      text4: '4 yrs'),
  JobsDetail(
      image: 'assets/images/youtube.png',
      title: 'Backend Developer',
      subTitle: 'Youtube',
      renumeration: '\฿2000 / บาท',
      datePosted: '3 Weeks ago',
      text1: 'Part Time',
      text2: 'Remote',
      text3: 'Junior',
      text4: '4 yrs'),
  JobsDetail(
      image: 'assets/images/apple.jpeg',
      title: 'Customer Care',
      subTitle: 'Apple',
      renumeration: '\฿5000 / บาท',
      datePosted: '2 days ago',
      text1: 'Full Time',
      text2: 'Remote',
      text3: 'Senior',
      text4: '2 yrs')
];

List<String> getJobsRequirements() {
  return <String>[
    "Exceptional communication skills and team-working skills",
    "Know the principles of animation and you can create high fidelity prototypes",
    "Direct experience using Adobe Premiere, Adobe After Effects & other tools used to create videos, animations, etc.",
    "Good UI/UX knowledge",
    "Exceptional communication skills and team-working skills",
    "Know the principles of animation and you can create high fidelity prototypes",
    "Direct experience using Adobe Premiere, Adobe After Effects & other tools used to create videos, animations, etc.",
    "Good UI/UX knowledge",
  ];
}

List<String> getJobsRequirementsJob() {
  return <String>[
    "Exceptional communication skills and team-working skills",
    "Know the principles of animation and you can create high fidelity prototypes",
    "Direct experience using Adobe Premiere, Adobe After Effects & other tools used to create videos, animations, etc.",
    "Good UI/UX knowledge",
  ];
}

class Products {
  final String image, title, description;
  final int price, size, id;

  Products({
    this.id,
    this.image,
    this.description,
    this.price,
    this.size,
    this.title,
  });
}

List<Products> products = [
  Products(
    id: 1,
    title: 'Office Code',
    price: 204,
    size: 32,
    description: dummyText,
    image: 'assets/images/three.jpg',
  ),
  Products(
    id: 2,
    title: 'Belt Bag',
    price: 230,
    size: 32,
    description: dummyText,
    image: 'assets/images/two.jpg',
  ),
  Products(
    id: 3,
    title: 'Office Code',
    price: 237,
    size: 10,
    description: dummyText,
    image: 'assets/images/two.jpg',
  ),
  Products(
    id: 4,
    title: 'Old Fashion',
    price: 212,
    size: 12,
    description: dummyText,
    image: 'assets/images/four.jpg',
  ),
  // Product(
  //   id: 5,
  //   title: 'Office Code',
  //   price: 231,
  //   size: 12,
  //   description: dummyText,
  //   image: 'assets/images/bag_5.png',
  // ),
  // Product(
  //   id: 6,
  //   title: 'Office Code',
  //   price: 233,
  //   size: 12,
  //   description: dummyText,
  //   image: 'assets/images/bag_6.png',
  // ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
