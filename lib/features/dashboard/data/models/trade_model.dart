import 'package:predictiva_take_home_assesment/features/dashboard/domain/entities/trade_entity.dart';

class TradeModel extends TradeEntity {
  TradeModel({
    required String symbol,
    required String type,
    required String side,
    required double quantity,
    required int creationTime,
    required double price,
  }) : super(
          symbol: symbol,
          type: type,
          side: side,
          quantity: quantity,
          creationTime: creationTime,
          price: price,
        );

  factory TradeModel.fromJson(Map<String, dynamic> json) {
    return TradeModel(
      symbol: json['symbol'],
      type: json['type'],
      side: json['side'],
      quantity: json['quantity'],
      creationTime: json['creation_time'],
      price: json['price'],
    );
  }
}
