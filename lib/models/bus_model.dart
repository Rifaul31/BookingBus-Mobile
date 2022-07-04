class Bus {
  String busCode;
  String busName;
  String busType;
  String busSeats;
  String depLoc;
  String desLoc;
  DateTime depTime;
  DateTime arrTime;
  int price;

  Bus(
    this.busCode,
    this.busName,
    this.busType,
    this.busSeats,
    this.depLoc,
    this.desLoc,
    this.depTime,
    this.arrTime,
    this.price,
  );
}

List<Bus> buses = [
  Bus('PJ01', 'Primajasa', 'Large', '20', 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 9, 0), DateTime(2022, 7, 5, 10, 0), 100000),
  Bus('PJ02', 'Primajasa', 'Large', '18', 'Bandung', 'Jakarta', DateTime(2022, 7, 5, 13, 0), DateTime(2022, 7, 5, 14, 0), 100000)
];