class Bus {
  String busCode;
  String busName;
  int busSeats;
  int availableSeats;
  String depLoc;
  String desLoc;
  DateTime depTime;
  DateTime arrTime;
  int price;

  Bus(
    this.busCode,
    this.busName,
    this.busSeats,
    this.availableSeats,
    this.depLoc,
    this.desLoc,
    this.depTime,
    this.arrTime,
    this.price,
  );

  factory Bus.fromJson(Map<String, dynamic> jsonData) {
    return Bus(
      jsonData['code'],
      jsonData['name'],
      jsonData['seats'],
      jsonData['available_seats'],
      jsonData['departure_location'],
      jsonData['arrive_location'],
      jsonData['departure_time'],
      jsonData['arrival_time'],
      jsonData['price']
      );
  }
}

//List<Bus> buses = [
//  Bus('PJ01', 'Primajasa', 20, 20, 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 9, 0), DateTime(2022, 7, 5, 10, 0), 100000),
//  Bus('PJ02', 'Primajasa', 20, 18, 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000),
//  Bus('PJ02', 'Metro', 20, 20, 'Palembang', 'Jogjakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000),
//  Bus('PJ01', 'Primajasa', 20, 20, 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 9, 0), DateTime(2022, 7, 5, 10, 0), 100000),
//  Bus('PJ02', 'Primajasa', 20, 18, 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000),
//  Bus('PJ02', 'Metro', 20, 20, 'Palembang', 'Jogjakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000),
//  Bus('PJ01', 'Primajasa', 20, 20, 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 9, 0), DateTime(2022, 7, 5, 10, 0), 100000),
//  Bus('PJ02', 'Primajasa', 20, 18, 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000),
//  Bus('PJ02', 'Metro', 20, 20, 'Palembang', 'Jogjakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000),
//  Bus('PJ01', 'Primajasa', 20, 20, 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 9, 0), DateTime(2022, 7, 5, 10, 0), 100000),
//  Bus('PJ02', 'Primajasa', 20, 18, 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000),
//  Bus('PJ02', 'Metro', 20, 20, 'Palembang', 'Jogjakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000),
//  Bus('PJ01', 'Primajasa', 20, 20, 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 9, 0), DateTime(2022, 7, 5, 10, 0), 100000),
//  Bus('PJ02', 'Primajasa', 20, 18, 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000),
//  Bus('PJ02', 'Metro', 20, 20, 'Palembang', 'Jogjakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000),
//  Bus('PJ01', 'Primajasa', 20, 20, 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 9, 0), DateTime(2022, 7, 5, 10, 0), 100000),
//  Bus('PJ02', 'Primajasa', 20, 18, 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000),
//  Bus('PJ02', 'Metro', 20, 20, 'Palembang', 'Jogjakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000),
//];