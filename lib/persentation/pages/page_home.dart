import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/persentation/bloc/product-bloc/product_bloc.dart';
import 'package:klontong_app/persentation/widgets/loading_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> product = [];

  @override
  void initState() {
    Future.microtask(() {
      context.read<ProductBloc>().add(FetchAllProduct());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductLoaded) {
            setState(() {
              product = state.product;
            });
          }
        },
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: LoadingIndicator());
            }
            if (state is ProductLoaded) {
              return _buildList();
            }
            if (state is ProductError) {
              return Center(
                  child: Text(
                state.message,
                textAlign: TextAlign.center,
              ));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView();
  }
}
