class Order{
  final String description;
  final double price;
  final String costumerName;
  final DateTime timestamp;

  Order({required this.description,required this.price,required this.costumerName,required this.timestamp});

  factory Order.fromRTDB(Map<String,dynamic> data){
    return Order(
        description: data['description'] ?? 'Drink',
        price: data['price'] ?? 0.0,
        costumerName: data['costumer'] ?? 'Unknown',
        timestamp: (data['time'] != null)
            ? DateTime.fromMillisecondsSinceEpoch(data['time'])
            : DateTime.now());
  }

}

