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
    this.availableSeats,
    this.busSeats,
    this.depLoc,
    this.desLoc,
    this.depTime,
    this.arrTime,
    this.price,
  );
}

List<Bus> busList = [
  Bus('PJ01', 'Primajasa', 20, 20, 'Bandung', 'Jakarta', DateTime(2022, 7, 12, 9, 0), DateTime(2022, 7, 5, 10, 0), 100000),
  Bus('PJ02', 'Primajasa', 20, 20, 'Bandung', 'Jogjakarta', DateTime(2022, 7, 12, 9, 0), DateTime(2022, 7, 5, 10, 0), 130000),
  Bus('PJ03', 'Primajasa', 20, 20, 'Jakarta', 'Bogor', DateTime(2022, 7, 12, 9, 0), DateTime(2022, 7, 5, 10, 0), 150000),
  Bus('PJ01', 'Primajasa', 20, 20, 'Bandung', 'Jakarta', DateTime(2022, 7, 13, 9, 0), DateTime(2022, 7, 5, 10, 0), 130000),
  Bus('PJ02', 'Primajasa', 20, 20, 'Jogjakarta', 'Bandung', DateTime(2022, 7, 13, 9, 0), DateTime(2022, 7, 5, 10, 0), 100000),
  Bus('PJ03', 'Primajasa', 20, 20, 'Bogor', 'Bandung', DateTime(2022, 7, 13, 9, 0), DateTime(2022, 7, 5, 10, 0), 110000),
  Bus('MT01', 'Metro', 18, 18, 'Bandung', 'Jakarta', DateTime(2022, 7, 12, 13, 0), DateTime(2022, 7, 5, 14, 0), 120000),
  Bus('MT02', 'Metro', 18, 18, 'Bandung', 'Jogjakarta', DateTime(2022, 7, 12, 13, 0), DateTime(2022, 7, 5, 14, 0), 130000),
  Bus('MT03', 'Metro', 18, 18, 'Jakarta', 'Bogor', DateTime(2022, 7, 13, 13, 0), DateTime(2022, 7, 5, 14, 0), 140000),
];

List<Bus> tickets = <Bus>[];