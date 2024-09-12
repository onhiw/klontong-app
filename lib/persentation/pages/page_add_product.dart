import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klontong_app/persentation/bloc/product-create-bloc/product_create_bloc.dart';
import 'package:klontong_app/persentation/widgets/button_loading_widget.dart';
import 'package:klontong_app/persentation/widgets/flushbar_widget.dart';
import 'package:klontong_app/persentation/widgets/input_decoration_widget.dart';
import 'package:klontong_app/styles/colors.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
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
          "Add Product",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      body: _buildDetail(),
    );
  }

  Widget _buildDetail() {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
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
              Column(
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
              const SizedBox(
                width: 16,
              ),
              Column(
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
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
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
              const SizedBox(
                width: 16,
              ),
              Column(
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
          BlocListener<ProductCreateBloc, ProductCreateState>(
            listener: (context, state) {
              if (state is ProductCreateSuccess) {
                Navigator.pop(context, true);
                flushbarMessage("Success Add Item", themeColor).show(context);
              }

              if (state is ProductCreateError) {
                flushbarMessage(state.message, Colors.red).show(context);
              }
            },
            child: BlocBuilder<ProductCreateBloc, ProductCreateState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    if (validates()) {
                      Future.microtask(() {
                        context.read<ProductCreateBloc>().add(PostProduct(
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
                      child: (state is ProductCreateLoading)
                          ? const ButtonLoadingWidget(color: Colors.white)
                          : Text(
                              "Submit",
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
    );
  }
}
