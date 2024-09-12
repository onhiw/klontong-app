import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klontong_app/persentation/bloc/product-detail-bloc/product_detail_bloc.dart';
import 'package:klontong_app/persentation/bloc/product-update-bloc/product_update_bloc.dart';
import 'package:klontong_app/persentation/widgets/button_loading_widget.dart';
import 'package:klontong_app/persentation/widgets/flushbar_widget.dart';
import 'package:klontong_app/persentation/widgets/input_decoration_widget.dart';
import 'package:klontong_app/persentation/widgets/loading_indicator.dart';
import 'package:klontong_app/styles/colors.dart';

class EditProductPage extends StatefulWidget {
  final String? id;
  const EditProductPage({super.key, @required this.id});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController textEditingProductId = TextEditingController();
  TextEditingController textEditingName = TextEditingController();
  TextEditingController textEditingSku = TextEditingController();
  TextEditingController textEditingDesc = TextEditingController();
  TextEditingController textEditingWeight = TextEditingController();
  TextEditingController textEditingWidth = TextEditingController();
  TextEditingController textEditingLength = TextEditingController();
  TextEditingController textEditingHeight = TextEditingController();
  TextEditingController textEditingImage = TextEditingController();
  TextEditingController textEditingPrice = TextEditingController();

  @override
  void initState() {
    Future.microtask(() {
      context.read<ProductDetailBloc>().add(FetchProductDetail(id: widget.id));
    });
    super.initState();
  }

  bool validates() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
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
          "Edit Product",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      body: BlocListener<ProductDetailBloc, ProductDetailState>(
        listener: (context, state) {
          if (state is ProductDetailLoaded) {
            setState(() {
              textEditingName = TextEditingController(text: state.product.name);
              textEditingSku = TextEditingController(text: state.product.sku);
              textEditingDesc =
                  TextEditingController(text: state.product.description);
              textEditingWeight =
                  TextEditingController(text: state.product.weight.toString());
              textEditingWidth =
                  TextEditingController(text: state.product.width.toString());
              textEditingLength =
                  TextEditingController(text: state.product.length.toString());
              textEditingHeight =
                  TextEditingController(text: state.product.height.toString());
              textEditingImage =
                  TextEditingController(text: state.product.image);
              textEditingPrice =
                  TextEditingController(text: state.product.price.toString());
            });
          }
        },
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
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
      ),
    );
  }

  Widget _buildDetail() {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID Product',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 14, color: textColor, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: textEditingProductId,
                cursorColor: themeColor,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                decoration: inputDecoration(
                  "ID Product",
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Name Product',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 14, color: textColor, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: textEditingName,
                cursorColor: themeColor,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                decoration: inputDecoration(
                  "Name Product",
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text),
            const SizedBox(
              height: 16,
            ),
            Text(
              'SKU',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 14, color: textColor, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: textEditingSku,
                cursorColor: themeColor,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                decoration: inputDecoration(
                  "SKU",
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Weight',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                          controller: textEditingWeight,
                          cursorColor: themeColor,
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          decoration: inputDecoration(
                            "Weight",
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Length',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                          controller: textEditingLength,
                          cursorColor: themeColor,
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          decoration: inputDecoration(
                            "Length",
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Width',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                          controller: textEditingWidth,
                          cursorColor: themeColor,
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          decoration: inputDecoration(
                            "Width",
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Height',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                          controller: textEditingHeight,
                          cursorColor: themeColor,
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          decoration: inputDecoration(
                            "Height",
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Url Image',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 14, color: textColor, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: textEditingImage,
                cursorColor: themeColor,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                decoration: inputDecoration(
                  "Url Image",
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Price',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 14, color: textColor, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: textEditingPrice,
                cursorColor: themeColor,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                decoration: inputDecoration(
                  "Price",
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Description',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 14, color: textColor, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                controller: textEditingDesc,
                cursorColor: themeColor,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                decoration: inputDecoration(
                  "Description",
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text),
            const SizedBox(
              height: 24,
            ),
            BlocListener<ProductUpdateBloc, ProductUpdateState>(
              listener: (context, state) {
                if (state is ProductUpdateSuccess) {
                  Navigator.pop(context, true);
                  flushbarMessage(state.message, themeColor).show(context);
                }

                if (state is ProductUpdateError) {
                  flushbarMessage(state.message, Colors.red).show(context);
                }
              },
              child: BlocBuilder<ProductUpdateBloc, ProductUpdateState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      if (validates()) {
                        Future.microtask(() {
                          context.read<ProductUpdateBloc>().add(PutProduct(
                              id: widget.id,
                              productId: int.parse(textEditingProductId.text),
                              categoryId: 1,
                              categoryName: "Cemilan",
                              sku: textEditingSku.text,
                              name: textEditingName.text,
                              description: textEditingDesc.text,
                              weight: int.parse(textEditingWeight.text),
                              width: int.parse(textEditingWidth.text),
                              length: int.parse(textEditingLength.text),
                              height: int.parse(textEditingHeight.text),
                              image: textEditingImage.text,
                              price: int.parse(textEditingPrice.text)));
                        });
                      }
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: (state is ProductUpdateLoading)
                            ? const ButtonLoadingWidget(color: Colors.white)
                            : Text(
                                "Save",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
