import 'package:first_project/core/api/product_api.dart';
import 'package:first_project/core/bloc/product/product_event.dart';
import 'package:first_project/core/bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  final api = ProductApi();

  ProductBloc(): super(ProductUninitialized());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    
    if(event is LoadProducts) {
      try {
        yield ProductLoading();
        final response = await api.loadProducts();
        yield ProductsLoaded(data: response);
      } catch (error) {
        print(error);
        yield ProductFailure(error: error);
      }
    }

  }

}