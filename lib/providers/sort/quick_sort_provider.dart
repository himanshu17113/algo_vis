import 'package:algo_vis/model/sort_model.dart';
import 'package:algo_vis/providers/sort/sort_provider.dart';

class QuickSortProvider extends SortProvider {


 @override
  Future<void> onExecute([int? value]) async {
    await quickSort();
  }

  Future<void> quickSort() async {
    await _quickSortHelper(numbers, 0, numbers.length - 1);
  }

  Future<void> _quickSortHelper(List<SortModel> list, int start, int end) async {
    if (isCancelled || start >= end) {
      if (start == end) {
          markNodeAsSorted(start);
      }
      return;
    }

    int pivotIndex = start;
    int leftPointer = start + 1;
    int rightPointer = end;

    markNodeAsPivot(pivotIndex);
    notifyListeners();
    await wait();

    while (rightPointer >= leftPointer) {
      if (isCancelled) return;

      markNodesForSorting(leftPointer, rightPointer);
      notifyListeners();
      await wait();
      
      // Swap if needed
      if (list[leftPointer].value > list[pivotIndex].value &&
          list[rightPointer].value < list[pivotIndex].value) {
        final tmp = list[leftPointer];
        list[leftPointer] = list[rightPointer];
        list[rightPointer] = tmp;
        notifyListeners();
        await wait();
      }
      
      markNodesAsNotSorted(leftPointer, rightPointer);

      if (list[leftPointer].value <= list[pivotIndex].value) {
        leftPointer++;
      }
      if (list[rightPointer].value >= list[pivotIndex].value) {
        rightPointer--;
      }
    }

    // Swap pivot with right pointer
    final tmp = list[pivotIndex];
    list[pivotIndex] = list[rightPointer];
    list[rightPointer] = tmp;
    
    markNodeAsSorted(rightPointer);
    notifyListeners();
    await wait();

    // Recursively sort the smaller partition first for optimization
    bool leftSubarrayIsSmaller = rightPointer - 1 - start < end - (rightPointer + 1);
    if (leftSubarrayIsSmaller) {
      await _quickSortHelper(list, start, rightPointer - 1);
      await _quickSortHelper(list, rightPointer + 1, end);
    } else {
      await _quickSortHelper(list, rightPointer + 1, end);
      await _quickSortHelper(list, start, rightPointer - 1);
    }
  }
}