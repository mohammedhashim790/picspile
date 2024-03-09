import 'dart:core';

abstract class APIService<T> {
  Future<List<T>> listAll();

  Future<T> getItem({required String id});

  Future<T> createItem({required T item});
}
