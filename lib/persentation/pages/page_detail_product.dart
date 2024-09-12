import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/persentation/bloc/product-detail-bloc/product_detail_bloc.dart';
import 'package:klontong_app/persentation/widgets/loading_indicator.dart';
import 'package:klontong_app/styles/colors.dart';

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
      context.read<ProductDetailBloc>().add(FetchProductDetail(id: widget.id));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: textColor),
        title: const Text(
          "Detail Product",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading) {
            return const Center(child: LoadingIndicator());
          }
          if (state is ProductDetailLoaded) {
            return _buildDetail(state.product);
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

  Widget _buildDetail(Product product) {
    return ListView(
      children: [
        Image.network(
          product.image ?? "",
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                product.name ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                product.description ?? "",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[400]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
