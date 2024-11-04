import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Inventory Management'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController newDescriptionController = TextEditingController();
  TextEditingController newCategoryController = TextEditingController();

  String result = '';
  final baseUrl = "https://inventory-app-manager.onrender.com/inventory";

  Future<void> addItem() async {
    try {
      final url = Uri.parse("$baseUrl/add").replace(queryParameters: {
        'name': nameController.text,
        'quantity': quantityController.text,
        'description': descriptionController.text,
        'category': categoryController.text,
      });

      final response = await http.post(url);

      setState(() {
        result = response.statusCode == 200
            ? "Item added successfully"
            : "Failed to add item: ${response.body}";
      });
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  Future<void> removeItem(String name) async {
    final url = Uri.parse("$baseUrl/remove?name=$name");
    try {
      final response = await http.delete(url);
      setState(() {
        result = response.statusCode == 200
            ? "Item removed successfully"
            : "Failed to remove item: ${response.body}";
      });
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  Future<void> updateQuantity(String name, int quantity) async {
    final url =
        Uri.parse("$baseUrl/updateQuantity?name=$name&quantity=$quantity");
    try {
      final response = await http.put(url);
      setState(() {
        result = response.statusCode == 200
            ? "Quantity updated successfully"
            : "Failed to update quantity: ${response.body}";
      });
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  Future<void> updateDescription(String name, String newDescription) async {
    final url = Uri.parse(
        "$baseUrl/updateDescription?name=$name&newDescription=$newDescription");
    try {
      final response = await http.put(url);
      setState(() {
        result = response.statusCode == 200
            ? "Description updated successfully"
            : "Failed to update description: ${response.body}";
      });
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  Future<void> updateCategory(String name, String newCategory) async {
    final url = Uri.parse(
        "$baseUrl/updateCategory?name=$name&newCategory=$newCategory");
    try {
      final response = await http.put(url);
      setState(() {
        result = response.statusCode == 200
            ? "Category updated successfully"
            : "Failed to update category: ${response.body}";
      });
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  Future<void> searchByCategory(String category) async {
    final url = Uri.parse("$baseUrl/searchByCategory?category=$category");
    try {
      final response = await http.get(url);
      setState(() {
        result = response.statusCode == 200
            ? response.body
            : "No items found in category";
      });
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  Future<void> searchByDescription(String description) async {
    final url =
        Uri.parse("$baseUrl/searchByDescription?description=$description");
    try {
      final response = await http.get(url);
      setState(() {
        result = response.statusCode == 200
            ? response.body
            : "No items found with description";
      });
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  Future<void> searchByName(String name) async {
    final url = Uri.parse("$baseUrl/searchByName?name=$name");
    try {
      final response = await http.get(url);
      setState(() {
        result = response.statusCode == 200 ? response.body : "Item not found";
      });
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  Future<void> showInventory() async {
    final url = Uri.parse("$baseUrl/show");
    try {
      final response = await http.get(url);
      setState(() {
        result = response.statusCode == 200
            ? response.body
            : "Failed to load inventory";
      });
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  Future<void> showHistory() async {
    final url = Uri.parse("$baseUrl/history");
    try {
      final response = await http.get(url);
      setState(() {
        result = response.statusCode == 200
            ? response.body
            : "Failed to load history";
      });
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: newDescriptionController,
              decoration: const InputDecoration(labelText: 'New Description'),
            ),
            TextField(
              controller: newCategoryController,
              decoration: const InputDecoration(labelText: 'New Category'),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                ElevatedButton(
                  onPressed: addItem,
                  child: const Text("Add Item"),
                ),
                ElevatedButton(
                  onPressed: () => removeItem(nameController.text),
                  child: const Text("Remove Item"),
                ),
                ElevatedButton(
                  onPressed: () => updateQuantity(
                      nameController.text, int.parse(quantityController.text)),
                  child: const Text("Update Quantity"),
                ),
                ElevatedButton(
                  onPressed: () => updateDescription(
                      nameController.text, newDescriptionController.text),
                  child: const Text("Update Description"),
                ),
                ElevatedButton(
                  onPressed: () => updateCategory(
                      nameController.text, newCategoryController.text),
                  child: const Text("Update Category"),
                ),
                ElevatedButton(
                  onPressed: () => searchByCategory(categoryController.text),
                  child: const Text("Search by Category"),
                ),
                ElevatedButton(
                  onPressed: () =>
                      searchByDescription(descriptionController.text),
                  child: const Text("Search by Description"),
                ),
                ElevatedButton(
                  onPressed: () => searchByName(nameController.text),
                  child: const Text("Search by Name"),
                ),
                ElevatedButton(
                  onPressed: showInventory,
                  child: const Text("Show Inventory"),
                ),
                ElevatedButton(
                  onPressed: showHistory,
                  child: const Text("Show History"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                result,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
