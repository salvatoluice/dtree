class Booking {
  final String discountName;
  final String storeName;
  final String time;
  final double initialPrice;
  final int discount;
  final double priceAfterDiscount;

  Booking({
    required this.discountName,
    required this.storeName,
    required this.time,
    required this.initialPrice,
    required this.discount,
    required this.priceAfterDiscount,
  });
}
