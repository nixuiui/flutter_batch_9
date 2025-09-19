import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_batch_9/pages/day_7/data/database/app_database.dart';
import 'package:flutter_batch_9/pages/day_7/data/database/product_db.dart';
import 'package:flutter_batch_9/pages/singleton.dart';

class ProductFormPage extends StatefulWidget {

  final Product? product;

  const ProductFormPage({super.key, this.product});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {

  final productDb = ProductDb(getIt<AppDatabase>());
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    print('widget.product: ${widget.product}');
    if (widget.product != null) {
      nameController.text = widget.product!.name;
      priceController.text = widget.product!.price.toString();
      descriptionController.text = widget.product!.description ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void saveProduct() async {
    final name = nameController.text;
    final price = double.tryParse(priceController.text);
    final description = descriptionController.text.isNotEmpty ? descriptionController.text : null;

    if (name.isEmpty || price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly')),
      );
      return;
    }

    final product = ProductsCompanion(
      id: widget.product != null ? drift.Value(widget.product!.id) : drift.Value.absent(),
      name: drift.Value(name),
      price: drift.Value(price),
      description: drift.Value(description),
    );

    if (widget.product == null) {
      await productDb.insertProduct(product);
    } else {
      await productDb.updateProduct(product);
    }

    Navigator.pop(context); // Go back to the previous page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FilledButton(
            onPressed: saveProduct,
            child: const Text('Save Product'),
          ),
        ),
      ),
    );
  }
}