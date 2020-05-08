import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

enum SaleType { rent, lease, contract, unknown }

const Map<SaleType, String> saleTypeNames = {
  SaleType.rent: '월세',
  SaleType.lease: '전세',
  SaleType.contract: '매매',
  SaleType.unknown: "?",
};

class Sale {
  Sale({
    @required this.id,
    @required this.apartName,
    @required this.address1,
    @required this.address2,
    @required this.imageAssetPath,
    @required this.saleType,
    @required this.space,
    @required this.depositMoney,
    @required this.rentalMoney,
    @required this.contractDate,
  });

  final int id;
  final String apartName;
  final String address1;
  final String address2;
  final String imageAssetPath;
  final SaleType saleType;
  final int space;
  final int depositMoney;
  final int rentalMoney;
  final DateTime contractDate;

  String get saleTypeName => saleTypeNames[saleType];
  String get spaceName => "$space평";
  String get addressDongHoText => getAddressDongHoText();
  String get detailsText => getDetailsText();

  String getAddressDongHoText() {
    var splits = address2.split(' ');
    String dong = splits[splits.length - 2];
    String ho = splits[splits.length - 1];
    return "$dong $ho";
  }

  String getDetailsText() {
    String moneyText = "";
    String depositMoneyText = "보증금 $depositMoney만원";
    if (depositMoney > 10000)
      depositMoneyText = "보증금 ${depositMoney / 10000}억원";
    moneyText += depositMoneyText;
    String rentalMoneyText = "";
    if (rentalMoney > 0) {
      rentalMoneyText = "월세 $rentalMoney만원";
      moneyText += ", $rentalMoneyText";
    }
    return "$spaceName, $saleTypeName, $moneyText";
  }
}
