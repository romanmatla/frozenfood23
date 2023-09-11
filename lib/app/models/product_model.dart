import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();
  factory ProductModel({
    required String id,
    required String title,
    required DateTime dataAdded,
    required DateTime expirationDate,
    required String quantity,}
  ) = _ProductModel;

  String releaseDateFormateted() {
    return DateFormat.yMMMEd().format(expirationDate);
  }

  String releaseAddDateFormatted() {
    return DateFormat.yMMMEd().format(dataAdded);
  }


}
