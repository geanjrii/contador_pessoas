abstract interface class CounterApi {
  Future<int> getValue();
  void saveValue(int value);
}
