/// A Stack Data Structure implemented using a growable [List]
class YcStack<E> {
  final List<E> _stack = List<E>.empty(growable: true);

  /// Returns an immutable snapshot of the stack as a [List]
  List<E> get stack => List<E>.unmodifiable(_stack);

  /// Adds the [value] element to the end of the stack - [_stack]
  void push(E value) => _stack.add(value);

  /// Pops and returns the last element of the stack - [_stack] of type [E]
  E pop() => _stack.removeLast();

  /// Returns the index of the [element] based on the condition of equality
  ///
  /// If the [element] is not in the [_stack] then -1 is returned
  ///
  /// **NOTE:** If the type of [element] ([E]) - is an object, make sure that
  /// the `==` operator is overridden or handled as per the requirements of
  /// your use-case.
  int indexOf(E element) => _stack.indexWhere((item) => element == item);

  /// [removeElement] removes last occurance of the [element] from [_stack]
  void removeElement(E element) {
    _stack.reversed;
    _stack.remove(element);
    _stack.reversed;
  }

  /// Returns the last element.
  ///
  /// Throws a StateError if this is empty.
  /// Otherwise may iterate through the elements and returns the last one seen.
  E get peek => _stack.last;

  /// Whether this collection has no elements.
  ///
  /// May be computed by checking if iterator.moveNext() returns false.
  bool get isEmpty => _stack.isEmpty;

  /// Whether this collection has at least one element.
  ///
  /// May be computed by checking if iterator.moveNext() returns true.
  bool get isNotEmpty => _stack.isNotEmpty;

  @override
  String toString() => _stack.toString();
}
