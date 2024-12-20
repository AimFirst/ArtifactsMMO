import 'package:artifacts_mmo/infrastructure/api/dto/paged_response.dart';

class AllPageLoader {
  static Future<List<V>> loadAllPaged<V, T extends PagedResponse<V>>(
    Future<PagedResponse<V>> Function(int) fetcher,
  ) async {
    final result = <V>[];
    var nextPage = 1;
    var totalPages = 0;
    do {
      final response = await fetcher(nextPage);
      result.addAll(response.data);
      totalPages = response.pages ?? 1;
    } while (nextPage++ < totalPages);
    return result;
  }
}
