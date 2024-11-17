import 'package:test/test.dart';
import 'package:artifacts_api/artifacts_api.dart';

/// tests for EventsApi
void main() {
  final instance = ArtifactsApi().getEventsApi();

  group(EventsApi, () {
    // Get All Active Events
    //
    // Fetch active events details.
    //
    //Future<DataPageActiveEventSchema> getAllActiveEventsEventsActiveGet({ int page, int size }) async
    test('test getAllActiveEventsEventsActiveGet', () async {
      // TODO
    });

    // Get All Events
    //
    // Fetch events details.
    //
    //Future<DataPageEventSchema> getAllEventsEventsGet({ int page, int size }) async
    test('test getAllEventsEventsGet', () async {
      // TODO
    });
  });
}
