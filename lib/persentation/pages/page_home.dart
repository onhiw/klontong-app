import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/persentation/bloc/product-bloc/product_bloc.dart';
import 'package:klontong_app/persentation/bloc/product-delete-bloc/product_delete_bloc.dart';
import 'package:klontong_app/persentation/pages/page_add_product.dart';
import 'package:klontong_app/persentation/pages/page_detail_product.dart';
import 'package:klontong_app/persentation/pages/page_edit_product.dart';
import 'package:klontong_app/persentation/widgets/flushbar_widget.dart';
import 'package:klontong_app/persentation/widgets/loading_indicator.dart';
import 'package:klontong_app/styles/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> product = [];

  @override
  void initState() {
    _fetchAllProduct();
    super.initState();
  }

  void _fetchAllProduct() {
    Future.microtask(() {
      context.read<ProductBloc>().add(FetchAllProduct());
    });
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
        automaticallyImplyLeading: false,
        title: const Text(
          "All Product",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddProductPage();
          })).then((value) => value ? _fetchAllProduct() : null);
        },
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
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
    return product.isEmpty
        ? const Center(
            child: Text(
            "Data Empty",
            textAlign: TextAlign.center,
          ))
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: product.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailProductPage(id: product[index].id);
                  }));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    height: 120,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              product[index].image ?? "",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product[index].name ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: textColor),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              product[index].description ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[400]),
                            ),
                          ],
                        )),
                        const SizedBox(
                          width: 16,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return EditProductPage(id: product[index].id);
                              })).then(
                                  (value) => value ? _fetchAllProduct() : null);
                            },
                            icon: const Icon(Icons.edit)),
                        BlocListener<ProductDeleteBloc, ProductDeleteState>(
                          listener: (context, state) {
                            if (state is ProductDeleteSuccess) {
                              _fetchAllProduct();

                              flushbarMessage(state.message, themeColor)
                                  .show(context);
                            }

                            if (state is ProductDeleteError) {
                              flushbarMessage(state.message, Colors.red)
                                  .show(context);
                            }
                          },
                          child: IconButton(
                              onPressed: () {
                                Future.microtask(() {
                                  context.read<ProductDeleteBloc>().add(
                                      DeleteByIdProduct(id: product[index].id));
                                });
                              },
                              icon: const Icon(Icons.delete)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
