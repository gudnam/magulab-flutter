import 'package:flutter/foundation.dart';
import 'package:magulab_flutter/models/sale.dart';

class Request {
  Request({
    @required this.id,
    @required this.apartName,
    @required this.address1,
    @required this.address2,
    @required this.saleTypeName,
    @required this.spaceMin,
    @required this.spaceMax,
    @required this.depositMoneyMax,
    @required this.depositMoneyMin,
    @required this.rentalMoneyMax,
    @required this.rentalMoneyMin,
    @required this.desiredContractDate,
  });

  final int id;
  final String apartName;
  final String address1;
  final String address2;
  final String saleTypeName;
  final int spaceMin;
  final int spaceMax;
  final int depositMoneyMin;
  final int depositMoneyMax;
  final int rentalMoneyMin;
  final int rentalMoneyMax;
  final DateTime desiredContractDate;
  SaleType get saleType => convertSaleType(saleTypeName);

  SaleType convertSaleType(String saleTypeName) {
    if (saleTypeName == saleTypeNames[SaleType.rent])
      return SaleType.rent;
    else if (saleTypeName == saleTypeNames[SaleType.lease])
      return SaleType.lease;
    else if (saleTypeName == saleTypeNames[SaleType.contract])
      return SaleType.contract;
    else
      return SaleType.unknown;
  }
}
