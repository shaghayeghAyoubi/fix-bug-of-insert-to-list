import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CustomRxList<E> extends RxList<E> {
  CustomRxList() : super([]);

  void addItem(E item) {
    add(item);
  }

  @override
  void insert(int index, E element) {
    var length = this.length;
    RangeError.checkValueInInterval(index, 0, length, "index");
    addRefresh(element, false);
    if (index != length) {
      setRange(index + 1, length + 1, this, index);
      this[index] = element;
    }

    refresh();
  }

  void addRefresh(E element, bool refreshActive) {
    value.add(element);
    if (refreshActive) {
      refresh();
    }
  }
}
