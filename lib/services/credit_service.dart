import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:banktest/models/credit_profile.dart';

class CreditService {
  Future<CreditProfile> fetchCreditProfile() async {
    final data = await rootBundle.loadString('assets/mock_credit_profile.json');
    return CreditProfile.fromJson(json.decode(data));
  }
}
