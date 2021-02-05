import 'package:equatable/equatable.dart';
import 'package:first_project/core/model/product_model.dart';
import 'package:flutter/material.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductUninitialized extends ProductState {}

class ProductLoading extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<Product> data;

  const ProductsLoaded({
    @required this.data
  });

  @override
  List<Object> get props => [data];
}

class ProductFailure extends ProductState {
  final String error;

  const ProductFailure({
    @required this.error
  });

  @override
  List<Object> get props => [error];
}