// bubble_sort_provider.dart
import 'package:algo_vis/providers/sort/sort_provider.dart';

class BubbleSortProvider extends SortProvider {
  @override
  Future<void> onExecute() async {
    await bubbleSort();
  }

  Future<void> bubbleSort() async {
    var list = numbers;
    var sorted = false;
    var counter = 0;

    while (!sorted) {
      // Manually check for cancellation at the start of each pass.
      if (isCancelled) return;

      sorted = true;
      for (var i = 0; i < list.length - 1 - counter; i++) {
        // Manually check for cancellation within the inner loop.
        if (isCancelled) return;

        markNodesForSorting(i, i + 1);

        // Replace 'yield' with direct calls.
        notifyListeners();
        await wait();

        if (list[i].value > list[i + 1].value) {
          final tmp = list[i];
          list[i] = list[i + 1];
          list[i + 1] = tmp;
          sorted = false;

          // Replace 'yield' with direct calls after the swap.
          notifyListeners();
          await wait();
        }

        markNodesAsNotSorted(0, i + 1);
      }
      markNodeAsSorted(list.length - 1 - counter);

      // Update UI after marking a node as sorted.
      notifyListeners();
      await wait();

      counter++;
    }
  }
}
