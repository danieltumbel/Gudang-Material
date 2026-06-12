class StackRiwayat {
  List<String> _stack = [];


  void push(String data) {
    _stack.add(data);
  }

  void pop() {
    if (_stack.isNotEmpty) {
      print("Riwayat dihapus: ${_stack.removeLast()}");
    } else {
      print("Riwayat kosong.");
    }
  }

  void tampilkanRiwayat() {
    if (_stack.isEmpty) {
      print("Belum ada riwayat.");
      return;
    }

    print("\n===== RIWAYAT AKTIVITAS =====");

    for (int i = _stack.length - 1; i >= 0; i--) {
      print(_stack[i]);
    }
  }
}