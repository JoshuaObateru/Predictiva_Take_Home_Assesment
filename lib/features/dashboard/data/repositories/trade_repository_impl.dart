// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:http/http.dart' as http;

// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:predictiva_take_home_assesment/core/constants/api_endpoints.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/data/models/portfolio_model.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/data/models/trade_model.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/domain/entities/portfolio_entity.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/domain/trade_repository.dart';

class TradeRepositoryImpl implements TradeRepository {
  @override
  Future<List<TradeModel>> getOpenTrades() async {
    if (await DataConnectionChecker().hasConnection) {
      final response = await http.get(Uri.parse("${BASE_URL}${OPEN_ORDERS}"));
      // print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final orders = (data['data']['orders'] as List).map((order) => TradeModel.fromJson(order)).toList();
        return orders;
      } else {
        throw Exception("Something went wrong");
      }
    } else {
      throw Exception("No internet connection");
    }
  }

  @override
  Future<PortfolioModel> getPortfolio() async {
    if (await DataConnectionChecker().hasConnection) {
      final response = await http.get(Uri.parse("${BASE_URL}${PORTFOLIO}"));
      // print(response);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // print(data);
        final portfolio = PortfolioModel.fromJson(data);
        // print(portfolio);
        return portfolio;
      } else {
        throw Exception("Something went wrong");
      }
    } else {
      throw Exception("No internet connection");
    }
  }
}
