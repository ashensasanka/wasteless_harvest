import 'package:collection/collection.dart';

class PricePoint{
  final double x;
  final double y;
  PricePoint({required this.x, required this.y});
}
List<PricePoint>get pricePoints {
  final data = <double>[10,30,23,41,581,23];
  return data
      .mapIndexed(
      ((index, element) => PricePoint(x: index.toDouble(), y: element)))
      .toList();
}