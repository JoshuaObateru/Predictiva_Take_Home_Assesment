class TradeEntity {
  final String symbol;
  final String type;
  final String side;
  final double quantity;
  final int creationTime;
  final double price;

  TradeEntity({
    required this.symbol,
    required this.type,
    required this.side,
    required this.quantity,
    required this.creationTime,
    required this.price,
  });
}
