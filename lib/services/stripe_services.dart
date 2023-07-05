import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:smartlicense/controllers/loading.dart';
import 'package:smartlicense/utils/snackbar.dart';

class StripeServices {
  StripeServices._();
  static final StripeServices _instance = StripeServices._();
  static StripeServices get instance => _instance;
  final isDebugMode = true;
  // final double _stripeLimit = 5000;
  final _publishableKeyTest =
      'pk_test_51N9CtAJqsZvHhtvpszRd3A6rS4LeJ4fTBq2RdI45sqYNiOZr59Ld64zmqw00MYpgbGXkf3rQoNizeewKWfOACFXZ00n9FnSilq';
  final _secreteKeyTest =
      'sk_test_51N9CtAJqsZvHhtvp59jezQS0nnZAowA1hT09MLiIXBdELvu6EyH1xrAalEhTU3MgjHhWvsXuC2ygSDlF1rewCBHy00T8y4Q3q4';
  Future<void> initialize() async {
    Stripe.publishableKey = _publishableKeyTest;
    // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
    Stripe.urlScheme = 'flutterstripe';
    await Stripe.instance.applySettings();
    log('@initialize =====> Stripe is initialized');
  }

  String _calculate(double price) {
    double neee = price * 100;
    int ss = neee.ceil();
    return ss.toString();
  }

  Future<void> startPurchase(
      double amount, Future<void> Function(bool, String) purchaseHook) async {
    try {
      loading(true);

      Map<String, dynamic>? paymentIntentData =
          await _getPaymentIntent(_calculate(amount), 'EUR');
      if (paymentIntentData == null) {
        await alertSnackbar(
            'Payment Intent Error!. Payment failed, please try again.');
        return;
      }
      await Stripe.instance
          .initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['client_secret'],
          applePay: !Platform.isIOS
              ? null
              : const PaymentSheetApplePay(
                  merchantCountryCode: 'IT',
                ),
          googlePay: PaymentSheetGooglePay(
            merchantCountryCode: 'IT',
            testEnv: isDebugMode,
          ),
          style: ThemeMode.light,
          merchantDisplayName: 'My Ticket',
        ),
      )
          .then((val) async {
        loading(false);
        await _showPaymentIntentSheet(purchaseHook);
      });
    } catch (e, s) {
      log('@startPurchase onCatch=====> $e\n$s');

      purchaseHook.call(false, e.toString());
    }
  }

//this is used to show the bottom sheet where user can enter detials for that specific transaction and then payment is generated
  Future<void> _showPaymentIntentSheet(
      Future<void> Function(bool, String message) purchaseHook) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((val) async {
        await purchaseHook.call(true, 'Payment Successfull!');
      });
    } on StripeException catch (e) {
      await purchaseHook.call(false, e.error.message.toString());
      log('@_showPaymentIntentSheet onStripeException=====> ${e.error}');
    } catch (e) {
      await purchaseHook.call(false, e.toString());
      log('@_showPaymentIntentSheet onCatch=====> $e');
    }
  }

// this is used by stripe to send request to generate payment intent related data. its done on the stage 1.
  Future<Map<String, dynamic>?> _getPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      final response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer $_secreteKeyTest',
            'Content-Type': 'application/x-www-form-urlencoded'
          });

      return jsonDecode(response.body);
    } catch (err) {
      log('@_getPaymentIntentError===>${err.toString()}');
      return null;
    }
  }
}
