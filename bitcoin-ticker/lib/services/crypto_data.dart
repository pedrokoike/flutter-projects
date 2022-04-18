import 'package:bitcoin_ticker/Services/networking.dart';
import 'package:bitcoin_ticker/constants.dart';

class CryptoData {
  Future<dynamic> getCryptoData(String cryptoCoin, String currency) async {
    NetworkHelper networkHelper = NetworkHelper(
      Uri.https(
        'rest.coinapi.io',
        '/v1/exchangerate/$cryptoCoin/$currency',
        {
          'apikey': kApiKey,
        },
      ),
    );
    var cryptoData = await networkHelper.getData();
    return cryptoData;
  }
}
