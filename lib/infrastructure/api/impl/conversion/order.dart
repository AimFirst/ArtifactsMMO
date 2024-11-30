import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/order/open_order.dart';
import 'package:artifacts_mmo/infrastructure/api/dto/order/past_order.dart';

extension OrderConversion on GEOrderSchema {
  OpenOrder convert() {
    return OpenOrder(
      orderId: id,
      seller: seller,
      itemCode: code,
      price: price,
      createdAt: createdAt,
    );
  }
}

extension OrderHistoryConversion on GeOrderHistorySchema {
  PastOrder convert() {
    return PastOrder(
      orderId: orderId,
      seller: seller,
      buyer: buyer,
      itemCode: code,
      quantity: quantity,
      price: price,
      soldAt: soldAt,
    );
  }
}
