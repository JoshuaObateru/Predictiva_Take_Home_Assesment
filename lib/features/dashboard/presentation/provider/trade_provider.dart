import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/domain/entities/trade_entity.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/domain/trade_repository.dart';

class TradeProvider with ChangeNotifier {
  final TradeRepository _tradeRepository;
  TradeProvider(this._tradeRepository);

  List<TradeEntity> _openTrades = [];
  String _errorMessage = '';
  bool _isLoading = false;

  List<TradeEntity> get openTrades => _openTrades;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> fetchOpenTrades() async {
    try {
      _isLoading = true;
      _openTrades = await _tradeRepository.getOpenTrades();
      _isLoading = false;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
    }
    notifyListeners();
  }
}
