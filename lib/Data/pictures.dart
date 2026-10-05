import 'package:find_my_apartment/Domain/model/picture_model.dart';

final demo_pic_list = [
  Picture(
    id: '1',
    path: 'assets/images/off3.jpeg',
    title: 'Office Apartment',
    price: '\$1000 per month',
    location: 'Ajah, Lagos',
    initialLikes: 12,
  ),
  Picture(
    id: '2',
    path: 'assets/images/apart1.jpg',
    title: 'Apartment',
    price: '\$750 per month',
    location: 'Lekki, Lagos',
    initialLikes: 5,
    initialIsLiked: true,
  ),
  Picture(
    id: '3',
    path: 'assets/images/apart2.jpg',
    title: 'Apartment',
    price: '\$2000 per month',
    location: 'Victoria Island, Lagos',
  ),
  Picture(
    id: '4',
    path: 'assets/images/apart3.jpg',
    title: 'Apartment',
    initialLikes: 3,
    price: '\$1000 per month',
    location: 'Ikeja, Lagos',
  ),
];