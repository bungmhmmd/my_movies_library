import 'package:flutter/widgets.dart';

class FontSizes {
  static double small(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.03;
  static double medium(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04;
  static double large(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.05;
  static double extraLarge(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.08;
}
