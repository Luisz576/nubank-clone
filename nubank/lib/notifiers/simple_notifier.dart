import 'package:flutter/cupertino.dart';

class SimpleNotifier<T> extends ChangeNotifier{
  late final ValueNotifier<T> _value;

  SimpleNotifier(T initialValue){
    _value = ValueNotifier(initialValue);
  }

  ValueNotifier<T> get listenable => _value;
  T get value => _value.value;
  set value(T value) => _value.value = value;
}