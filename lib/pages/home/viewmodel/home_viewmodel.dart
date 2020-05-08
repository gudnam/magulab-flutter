import 'package:magulab_flutter/models/match.dart';
import 'package:magulab_flutter/models/request.dart';
import 'package:magulab_flutter/services/database.dart';
import 'package:flutter/foundation.dart';

class HomeRequestViewModel with ChangeNotifier {
  Future<Map<int, Request>> getRequestMap() async {
    Map<String, dynamic> requestsData =
        await DatabaseService().getRequestsData();
    Map<int, Request> requests = Map();
    for (var data in requestsData['request']) {
      Request request = Request(
        id: data['id'],
        apartName: data['apartName'],
        address1: data['address1'],
        address2: data['address2'],
        saleTypeName: data['saleType'],
        spaceMax: data['spaceMax'],
        spaceMin: data['spaceMin'],
        depositMoneyMax: data['depositMoneyMax'],
        depositMoneyMin: data['depositMoneyMin'],
        rentalMoneyMax: data['rentalMoneyMax'],
        rentalMoneyMin: data['rentalMoneyMin'],
        desiredContractDate: data['desiredContractDate'],
      );
      requests[request.id] = request;
    }
    return requests;
  }
}

class HomeResponseViewModel with ChangeNotifier {
  Future<List<Match>> getMatches() async {
    Map<String, dynamic> matchesData = await DatabaseService().getMatchesData();
    if (matchesData == null) return null;

    Map<int, Request> requestMap = await HomeRequestViewModel().getRequestMap();

    List<Match> matches = List();
    for (var data in matchesData['match']) {
      Request matchedRequest = requestMap[data['requestId']];
      if (matchedRequest == null) continue;
      MatchedSale matchedSale = MatchedSale(
          saleId: data['matchedSale']['saleId'],
          rate: data['matchedSale']['rate']);
      matches.add(Match(
          id: data['id'], request: matchedRequest, matchedSale: matchedSale));
    }

    return matches;
  }
}
