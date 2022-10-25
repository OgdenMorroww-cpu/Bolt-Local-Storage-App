// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _documentItems = [];
  final _documentBox = Hive.box("document_box");

  @override
  void initState() {
    super.initState();
    _refreshDocumentItems();
  }

  void _refreshDocumentItems() {
    final data = _documentBox.keys.map((key) {
      final value = _documentBox.get(key);
      return {
        "key": key,
        "documentName": value["documentName"],
        "quantity": value["quantity"],
      };
    }).toList();

    setState(() {
      _documentItems = data.reversed.toList();
    });
  }

  Future<void> _createDocumentItems(
      Map<String, dynamic> newDocumentItem) async {
    await _documentBox.add(newDocumentItem);
    _refreshDocumentItems();
  }

  Future<void> _updateDocumentItems(
      int documentItemKey, Map<String, dynamic> item) async {
    await _documentBox.put(documentItemKey, item);
    _refreshDocumentItems();
  }

  Future<void> _deleteDocumentItems(int documentItemKey) async {
    await _documentBox.delete(documentItemKey);
    _refreshDocumentItems();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Document deleted")),
    );
  }

  final TextEditingController _documentNameController = TextEditingController();
  final TextEditingController _documentQauntityController =
      TextEditingController();

  void _showForm(BuildContext context, int? documentItemKey) async {
    if (documentItemKey != null) {
      final existingItem = _documentItems
          .firstWhere((element) => element['key'] == documentItemKey);
      _documentNameController.text = existingItem['documentName'];
      _documentQauntityController.text = existingItem['quantity'];
    }

    showModalBottomSheet(
      context: context,
      elevation: 5.5,
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _documentNameController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Document Name",
                prefixIcon: Icon(Icons.edit),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _documentNameController.clear();
                  },
                ),
              ),
            ),
            SizedBox(height: 10.5),
            TextField(
              controller: _documentQauntityController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Document Quantity",
                prefixIcon: Icon(Icons.edit),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _documentNameController.clear();
                  },
                ),
              ),
            ),
            SizedBox(height: 10.5),
            MaterialButton(
              onPressed: () async {
                if (documentItemKey == null) {
                  _createDocumentItems({
                    "documentName": _documentNameController.text.trim(),
                    "quantity": _documentQauntityController.text.trim(),
                  });
                }

                if (documentItemKey != null) {
                  _updateDocumentItems(documentItemKey, {
                    "documentName": _documentNameController.text.trim(),
                    "quantity": _documentQauntityController.text.trim(),
                  });
                }
                _documentNameController.text = "";
                _documentQauntityController.text = "";
                Navigator.of(context).pop();
              },
              textColor: Colors.black,
              color: Colors.white,
              child: Text(documentItemKey == null ? "Create New" : "Update"),
              height: 45.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.5),
              ),
            ),
            SizedBox(height: 15.5),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 192, 91, 8),
        title: Text("Bolt Local Storage"),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.account_box),
          onPressed: () {
            Navigator.pushNamed(context, "profile");
          },
        ),
      ),
      body: _documentItems.isEmpty
          ? Center(
              child: Text(
                "No document data added",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              itemCount: _documentItems.length,
              itemBuilder: (_, index) {
                final currentDocumentItem = _documentItems[index];
                return Card(
                  margin: EdgeInsets.all(10.5),
                  elevation: 3.5,
                  child: ListTile(
                    title: Text(
                      "Doc Name: ${currentDocumentItem["documentName"]}",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      "Doc Number: ${currentDocumentItem["quantity"].toString()}",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () =>
                              _showForm(context, currentDocumentItem["key"]),
                        ),
                        IconButton(
                          onPressed: () =>
                              _deleteDocumentItems(currentDocumentItem["key"]),
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        child: Icon(FontAwesomeIcons.boltLightning),
        tooltip: "Bolt upload",
        backgroundColor: Color.fromARGB(255, 192, 91, 8),
      ),
    );
  }
}
