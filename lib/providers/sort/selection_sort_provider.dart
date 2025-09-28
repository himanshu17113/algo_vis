import 'package:algo_vis/providers/sort/sort_provider.dart';

class SelectionSortProvider extends SortProvider {
  @override
  Future<void> onExecute() async {
    await selectionSort();
  }

  Future<void> selectionSort() async {
    var list = numbers;
    for (var i = 0; i < list.length - 1; i++) {
      if (isCancelled) return;

      var smallestIndex = i;
      markNodeAsPivot(smallestIndex); // Mark current `i` as the temporary smallest
      notifyListeners();
      await wait();

      for (var j = i + 1; j < list.length; j++) {
        if (isCancelled) return;

        markNodeForSorting(j); // Mark node `j` for comparison
        notifyListeners();
        await wait();

        if (list[j].value < list[smallestIndex].value) {
          markNodeAsNotSorted(smallestIndex); // Unmark old smallest
          smallestIndex = j;
          markNodeAsPivot(smallestIndex); // Mark new smallest
        } else {
          markNodeAsNotSorted(j); // Unmark if not smaller
        }
        notifyListeners();
        await wait();
      }

      // Swap the found smallest element with the first element
      final tmp = list[i];
      list[i] = list[smallestIndex];
      list[smallestIndex] = tmp;

      markNodeAsNotSorted(smallestIndex);
      markNodeAsSorted(i); // Mark the element at `i` as sorted

      notifyListeners();
      await wait();
    }
    markNodeAsSorted(list.length - 1);
  }
}
