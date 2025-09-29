import 'package:algo_vis/providers/search/search_provider.dart';
import '../../model/search_model.dart';

class LinearSearchProvider extends SearchProvider {
  LinearSearchProvider() {
    // Initialize with a list of SearchModel objects.
    numbers.shuffle();
  }
  @override
  Future<void> onExecute([int? value]) async {
    // Calls the helper with a default value if none is provided.
    await _startLinearSearch(numbers, value ?? 34);
  }

  /// Performs a linear search on the list for the given target.
  Future<void> _startLinearSearch(List<SearchModel> list, int target) async {
    // Iterate through each item one by one.
    for (var i = 0; i < list.length; i++) {
      // Mark the current node as a potential match.
      potentialNode(i);
      await wait();

      if (list[i].value == target) {
        // If a match is found, mark it and exit the function.
        foundNode(i);
        return;
      } else {
        // If it's not a match, discard it.
        discardNode(i);
      }
    }

    // If the loop completes without returning, the node was not found.
    nodeNotFound();
  }
}
