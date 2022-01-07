class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
  });

  final String id;
  final String name;
  final String price;
}

const productList = [
  Product(
    id: '01',
    name: 'FRIEND ARTY DIAMONDS',
    price: '2,300 USD',
  ),
  Product(
    id: '02',
    name: 'FLOATING TOURBILLON',
    price: '1,700 USD',
  ),
  Product(
    id: '03',
    name: 'MADEMOISELLE PRIVÉ',
    price: '1,800 USD',
  ),
  Product(
    id: '04',
    name: 'PREMIÉRE ROCK',
    price: '1,300 USD',
  ),
];
