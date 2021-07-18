import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:quotes_app/model/quoteofday.dart';
import 'package:quotes_app/model/quotecategory.dart';

class QuotedDisplay {

  Future<QuoteofDay> getQOD() async {
    http.Response response;
// QuoteoftheDay is owned by https://favqs.com/api
    response = await http.get(Uri.parse('http://favqs.com/api/qotd'));
    if (response.statusCode == 200) {

      return QuoteofDay.fromJson(json.decode(response.body));
    } else {
      throw Exception("some error");
    }
  }
//category
  Future<QuoteCategory> getQuoteCategory() async {
    http.Response response;

    response = await http.get(Uri.parse('https://quotes.rest/qod/categories?language=en&detailed=false'));
    if (response.statusCode == 200) {
      print("entered 200");
      return QuoteCategory.fromJson(json.decode(response.body));
    } else {
      throw Exception("some error");
    }
  }



}
