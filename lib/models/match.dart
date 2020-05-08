import 'package:magulab_flutter/models/request.dart';
import 'package:magulab_flutter/models/sale.dart';
import 'package:magulab_flutter/utils/utils.dart';

class Match {
  Match({this.id, this.request, this.matchedSale});

  final int id;
  final Request request;
  final MatchedSale matchedSale;

  String get saleTypeName => saleTypeNames[request.saleType];
  String get spaceName => "${request.spaceMax}평";
  String get addressDongHoText => getAddressDongHoText();
  String get detailsText => getDetailsText();
  String get imageAssetPath => getImageAssetPath();
  String get matcingRate => "${matchedSale.rate}%";

  String getAddressDongHoText() {
    var splits = request.address2.split(' ');
    String dong = splits[splits.length - 2];
    String ho = splits[splits.length - 1];
    return "$dong $ho";
  }

  String getDetailsText() {
    String moneyText = "";
    String depositMoneyText = "보증금 ${request.depositMoneyMax}만원";
    if (request.depositMoneyMax > 10000)
      depositMoneyText = "보증금 ${request.depositMoneyMax / 10000}억원";
    moneyText += depositMoneyText;
    String rentalMoneyText = "";
    if (request.rentalMoneyMax > 0) {
      rentalMoneyText = "월세 ${request.rentalMoneyMax}만원";
      moneyText += ", $rentalMoneyText";
    }
    return "$spaceName, $saleTypeName, $moneyText";
  }

  String getImageAssetPath() {
    if (removeWhiteSpace(request.apartName) == "잠실엘스")
      return 'assets/images/jamsil_else.jpg';
    else if (removeWhiteSpace(request.apartName) == "잠실리센츠")
      return 'assets/images/jamsil_ricenz.jpg';
  }
}

class MatchedSale {
  final int rate;
  final int saleId;

  MatchedSale({this.rate, this.saleId});
}
