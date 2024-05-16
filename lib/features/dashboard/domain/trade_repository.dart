import 'package:predictiva_take_home_assesment/features/dashboard/domain/entities/portfolio_entity.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/domain/entities/trade_entity.dart';

abstract class TradeRepository {
  Future<List<TradeEntity>> getOpenTrades();
  Future<PortfolioEntity> getPortfolio();
}
