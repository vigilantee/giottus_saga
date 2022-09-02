import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/products.dart';
import 'package:shopping_cart/models/time.dart';
import 'package:shopping_cart/services/products.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:math';

const APITimeout = Duration(seconds: 1);
// max different items
const MaxCheckout = 2;

Future<Products> getProductsAPI() async {
  return Future<Products>.delayed(
      APITimeout, () => Products.fromJson(productsData));
}

Future<Time> fetchTimeAPI() async {
  var locations;
  try {
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/'));
    locations = jsonDecode(response.body);
  } catch (e) {
    print('caught error: $e');
    throw Exception('Can\'t do the api call');
  }
  String time;
  String location = locations[Random().nextInt(locations.length)] as String;
  try {
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$location'));
    Map data = jsonDecode(response.body);

    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    DateTime date = DateTime.parse(dateTime);
    date = date.add(Duration(hours: int.parse(offset)));
    time = DateFormat.jm().format(date);
  } catch (e) {
    print('caught error: $e');
    time = "could not fetch time data";
    throw Exception(time);
  }

  List<String> val = location.split("/");
  location = "${val[1]}, ${val[0]}";
  print(location);
  return Time(
      location: location, time: time, isError: false, isFetching: false);
}

Future<Cart> buyProductsAPI(Cart cart) async {
  return Future<Cart>.delayed(APITimeout, () {
    if (cart.quantityById.keys.length <= MaxCheckout) {
      return cart;
    } else {
      throw Exception(
          'You can buy $MaxCheckout items at maximum in a checkout');
    }
  });
}
