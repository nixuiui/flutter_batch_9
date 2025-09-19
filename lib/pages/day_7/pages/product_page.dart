import 'package:flutter/material.dart';
import 'package:flutter_batch_9/pages/day_6/bloc/theme_cubit.dart';
import 'package:flutter_batch_9/pages/day_7/data/database/app_database.dart';
import 'package:flutter_batch_9/pages/day_7/data/database/product_db.dart';
import 'package:flutter_batch_9/pages/day_7/pages/product_form_page.dart';
import 'package:flutter_batch_9/pages/singleton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final productDb = ProductDb(getIt<AppDatabase>());

  final List<Product> products = [];

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  Future<void> fetchProducts() async {
    final allProducts = await productDb.getAllProducts();
    setState(() {
      products.clear();
      products.addAll(allProducts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: Icon(
              context.watch<ThemeCubit>().state == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const ProductFormPage(),
              )).then((_) {
                fetchProducts(); // Refresh the product list after adding a new product
              });
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.description ?? '-'),
            trailing: Text('IDR ${product.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ProductFormPage(
                  product: product,
                ),
              )).then((_) {
                fetchProducts(); // Refresh the product list after adding a new product
              });
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete Product'),
                  content: const Text('Are you sure you want to delete this product?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        productDb.deleteProduct(product.id).then((_) {
                          fetchProducts(); // Refresh the product list after deletion
                        });
                      },
                      child: const Text('Delete', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );
            }
          );
        },
      ),
    );
  }
}