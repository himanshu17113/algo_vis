import 'package:algo_vis/providers/sort/sort_provider.dart';

class InsertionSortProvider extends SortProvider {


  @override
  Future<void> onExecute() async {
    await insertionSort();
  }


  Future<void> insertionSort() async {
    var list = numbers;
    for (var i = 1; i < list.length; i++) {
      if (isCancelled) return;
      
      var j = i;
      markNodeForSorting(j);
      notifyListeners();
      await wait();

      while (j > 0 && list[j].value < list[j - 1].value) {
        if (isCancelled) return;

        // Mark nodes for comparison and potential swap
        markNodesForSorting(j, j - 1);
        notifyListeners();
        await wait();

        // Perform the swap
        final tmp = list[j];
        list[j] = list[j - 1];
        list[j - 1] = tmp;
        
        // Unmark the previous position
        markNodeAsNotSorted(j);
        j--;

        // Show the result of the swap
        markNodeForSorting(j);
        notifyListeners();
        await wait();
      }
      markNodesAsNotSorted(0, list.length - 1);
    }
  }
}