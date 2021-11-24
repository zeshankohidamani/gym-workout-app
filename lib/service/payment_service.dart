import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

class StripeTransactionResponse {
  String message;
  bool success;

  StripeTransactionResponse({required this.message, required this.success});
}

class StripeService {
  static String apiBase = "https://api.stripe.com//v1";
  static String paymentApiUrl = "${StripeService.apiBase}/payment_intents";
  static String secret =
      "sk_test_51JysIyKdviNXQ6KPomqkJcO6AlUXixVSqOKT5WEhWt9yQMeVw1ZArBVHK8GtiSixU8Q1LN70UW6zradHYh0V68iz00aXzfEAun";
  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  static init() {
    StripePayment.setOptions(
      StripeOptions(
        publishableKey:
            "pk_test_51JysIyKdviNXQ6KPTxFfzoqw2lDcTZf4X8FrnGxwuCtoAmoxMqozCKCtHMBYhr6PMaBss019VyW8EXitfl4NqhmD00J7xDwgcc",
        merchantId: "Test",
        androidPayMode: 'test',
      ),
    );
  }

  static StripeTransactionResponse payVaiExistingCard({
    required String amount,
    required String currency,
    card,
  }) {
    return StripeTransactionResponse(
      message: "Transaction successful",
      success: true,
    );
  }

  static Future<StripeTransactionResponse> payWithNewCard({
    required String amount,
    required String currency,
  }) async {
    try {
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
        CardFormPaymentRequest(),
      );
      var paymentIntent = await StripeService.createPaymentIntent(
        amount,
        currency,
      );
      return StripeTransactionResponse(
        message: "Transaction successful",
        success: true,
      );
    } catch (e) {
      return StripeTransactionResponse(
        message: "Transaction failed: ${e.toString()}",
        success: true,
      );
    }
  }

  static Future<Map<String, dynamic>?> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
        Uri.parse(StripeService.paymentApiUrl),
        body: body,
        headers: StripeService.headers,
      );
      return jsonDecode(response.body);
    } catch (e) {
      print("error charging user: ${e.toString()}");
    }
    return null;
  }
}
