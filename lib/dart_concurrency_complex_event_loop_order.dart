/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

export 'src/dart_concurrency_complex_event_loop_order_base.dart';

void complexEventLoopOrder() {
  print('1 synchronous');
  Future(() => print('2 event queue')).then((_) => print('3 event queue'));
  Future.microtask(() => print('4 microtask queue'));
  Future.microtask(() => print('5 microtask queue'));
  Future.delayed(Duration(seconds: 1), () => print('6 event queue'));
  Future(() => print('7 event queue'))
      .then((_) => Future(() => print('8 event queue')));
  Future(() => print('9 event queue'))
      .then((_) => Future.microtask(() => print('10 microtask queue')));
  print('11 synchronous');
}

//1,11,4,5,2,3,7,9,10,8,6
