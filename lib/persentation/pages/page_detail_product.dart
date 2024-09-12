import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_app/persentation/bloc/product-detail-bloc/product_detail_bloc.dart';
import 'package:klontong_app/persentation/widgets/loading_indicator.dart';

class DetailProductPage extends StatefulWidget {
  final String? id;
  const DetailProductPage({super.key, @required this.id});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<ProductDetailBloc>().add(FetchProductDetail());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading) {
            return const Center(child: LoadingIndicator());
          }
          if (state is ProductDetailLoaded) {
            return _buildDetail();
          }
          if (state is ProductDetailError) {
            return Center(
                child: Text(
              state.message,
              textAlign: TextAlign.center,
            ));
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildDetail() {
    return ListView();
  }
}
