class Ticker {
  Stream<int> tick({int ticks}) {
    return Stream.periodic((Duration(seconds: 1)),
            (x) => ticks - x - 1) // ticks개 까지 1초마다 data를 1개씩 만든다.
        .take(ticks);
  }
}
