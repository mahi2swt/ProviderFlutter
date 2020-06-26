class DataModel {
  String title;
  String description;
  String price;
  String image;
  bool isAdded;

  DataModel({
    this.title,
    this.description,
    this.price,
    this.image,
    this.isAdded,
  });
}

List<DataModel> productList = [
  DataModel(
    title: 'MacBook Pro',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Bibendum est ultricies integer quis. Iaculis urna id volutpat lacus laoreet. Mauris vitae ultricies leo integer malesuada. Ac odio tempor orci dapibus ultrices in. Egestas diam in arcu cursus euismod.',
    price: '1299',
    image: 'assets/macbookPro.jpg',
    isAdded: false,
  ),
  DataModel(
    title: 'iPad Pro',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Bibendum est ultricies integer quis. Iaculis urna id volutpat lacus laoreet. Mauris vitae ultricies leo integer malesuada. Ac odio tempor orci dapibus ultrices in. Egestas diam in arcu cursus euismod.',
    price: '799',
    image: 'assets/ipad.jpg',
    isAdded: false,
  ),
  DataModel(
    title: 'iPhone 11 Pro',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Bibendum est ultricies integer quis. Iaculis urna id volutpat lacus laoreet. Mauris vitae ultricies leo integer malesuada. Ac odio tempor orci dapibus ultrices in. Egestas diam in arcu cursus euismod.',
    price: '999',
    image: 'assets/iphone.jpg',
    isAdded: false,
  ),
  DataModel(
    title: 'AirPods Pro',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Bibendum est ultricies integer quis. Iaculis urna id volutpat lacus laoreet. Mauris vitae ultricies leo integer malesuada. Ac odio tempor orci dapibus ultrices in. Egestas diam in arcu cursus euismod.',
    price: '249',
    image: 'assets/airpods.jpg',
    isAdded: false,
  ),
];
