import 'dart:convert';

import 'package:ecom_store_bloc/constants/strings.dart';
import 'package:ecom_store_bloc/data/model/product_model.dart';
import 'package:http/http.dart';

class GetProducts {
 Future<List<ProdectModel>> getproducts() async {
    Response datajson = await get(Uri.parse(baseurl));
    List data = json.decode(datajson.body);

    return data.map((e) {
      return ProdectModel.fromJson(e);
    }).toList();

  }
}
