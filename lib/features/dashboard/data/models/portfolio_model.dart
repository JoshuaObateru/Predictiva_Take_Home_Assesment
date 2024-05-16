import 'package:predictiva_take_home_assesment/features/dashboard/domain/entities/portfolio_entity.dart';

class PortfolioModel extends PortfolioEntity {
  PortfolioModel({
    required double balance,
    required double profit,
    required double profitPercentage,
    required int assets,
  }) : super(
          balance: balance,
          profit: profit,
          profitPercentage: profitPercentage,
          assets: assets,
        );

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    final portfolio = json['data']['portfolio'];
    return PortfolioModel(
      balance: portfolio['balance'].toDouble(),
      profit: portfolio['profit'].toDouble(),
      profitPercentage: portfolio['profit_percentage'].toDouble(),
      assets: portfolio['assets'],
    );
  }
}
