// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../data/drift_database.dart';
import '../ui/MainPage/main_page_view.dart';
import '../ui/add_category/add_category_view.dart';
import '../ui/add_transaction/add_transaction_view.dart';
import '../ui/home/home_view.dart';
import '../ui/startup/startup_view.dart';
import '../ui/transaction/transaction_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String mainPageView = '/main-page-view';
  static const String homeView = '/home-view';
  static const String addTransactionView = '/add-transaction-view';
  static const String addCategoryView = '/add-category-view';
  static const String transactionView = '/transaction-view';
  static const all = <String>{
    startUpView,
    mainPageView,
    homeView,
    addTransactionView,
    addCategoryView,
    transactionView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.mainPageView, page: MainPageView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.addTransactionView, page: AddTransactionView),
    RouteDef(Routes.addCategoryView, page: AddCategoryView),
    RouteDef(Routes.transactionView, page: TransactionView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    MainPageView: (data) {
      var args = data.getArgs<MainPageViewArguments>(
        orElse: () => MainPageViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainPageView(
          key: args.key,
          currentIndex: args.currentIndex,
        ),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    AddTransactionView: (data) {
      var args = data.getArgs<AddTransactionViewArguments>(
        orElse: () => AddTransactionViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => AddTransactionView(
          key: args.key,
          transaction: args.transaction,
        ),
        settings: data,
      );
    },
    AddCategoryView: (data) {
      var args = data.getArgs<AddCategoryViewArguments>(
        orElse: () => AddCategoryViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => AddCategoryView(key: args.key),
        settings: data,
      );
    },
    TransactionView: (data) {
      var args = data.getArgs<TransactionViewArguments>(
        orElse: () => TransactionViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => TransactionView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// MainPageView arguments holder class
class MainPageViewArguments {
  final Key? key;
  final int? currentIndex;
  MainPageViewArguments({this.key, this.currentIndex});
}

/// AddTransactionView arguments holder class
class AddTransactionViewArguments {
  final Key? key;
  final Transaction? transaction;
  AddTransactionViewArguments({this.key, this.transaction});
}

/// AddCategoryView arguments holder class
class AddCategoryViewArguments {
  final Key? key;
  AddCategoryViewArguments({this.key});
}

/// TransactionView arguments holder class
class TransactionViewArguments {
  final Key? key;
  TransactionViewArguments({this.key});
}
