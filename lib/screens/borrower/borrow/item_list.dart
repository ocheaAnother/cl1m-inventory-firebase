import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const BorrowItemList());
}

class BorrowItemList extends StatelessWidget {
  const BorrowItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Firestore',
      home: FetchBorrowItemList(),
    );
  }
}

class FetchBorrowItemList extends StatefulWidget {
  const FetchBorrowItemList({Key? key}) : super(key: key);

  @override
  _FetchBorrowItemListState createState() => _FetchBorrowItemListState();
}

class _FetchBorrowItemListState extends State<FetchBorrowItemList> {
// text fields' controllers
  final TextEditingController _propertyNumController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _acquisitionDateController =
      TextEditingController();
  final TextEditingController _estimatedLifeController =
      TextEditingController();
  final TextEditingController _officeDesignationController =
      TextEditingController();
  final TextEditingController _brandSerialNumController =
      TextEditingController();

  final CollectionReference _items =
      FirebaseFirestore.instance.collection('items');

  final CollectionReference _borrowedItems =
      FirebaseFirestore.instance.collection('borrowedItems');

  // Future<void> addBorrowItem([DocumentSnapshot? documentSnapshot]) async {
  //   if (documentSnapshot != null) {
  //     _propertyNumController.text = documentSnapshot['propertyNum'];
  //     _descriptionController.text = documentSnapshot['description'];
  //     _acquisitionDateController.text = documentSnapshot['acquisitionDate'];
  //     _estimatedLifeController.text = documentSnapshot['estimatedLife'];
  //     _officeDesignationController.text = documentSnapshot['officeDesignation'];
  //     _brandSerialNumController.text = documentSnapshot['brandSerialNum'];
  //   }

  //   await showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext ctx) {
  //         return Padding(
  //           padding: EdgeInsets.only(
  //               top: 20,
  //               left: 20,
  //               right: 20,
  //               bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               TextField(
  //                 controller: _propertyNumController,
  //                 decoration: const InputDecoration(labelText: 'propertyNum'),
  //               ),
  //               TextField(
  //                 controller: _descriptionController,
  //                 decoration: const InputDecoration(labelText: 'description'),
  //               ),
  //               TextField(
  //                 controller: _acquisitionDateController,
  //                 decoration:
  //                     const InputDecoration(labelText: 'acquisitionDate'),
  //               ),
  //               TextField(
  //                 controller: _estimatedLifeController,
  //                 decoration: const InputDecoration(labelText: 'estimatedLife'),
  //               ),
  //               TextField(
  //                 controller: _officeDesignationController,
  //                 decoration:
  //                     const InputDecoration(labelText: 'officeDesignation'),
  //               ),
  //               TextField(
  //                 controller: _brandSerialNumController,
  //                 decoration:
  //                     const InputDecoration(labelText: 'brandSerialNum'),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               ElevatedButton(
  //                 child: const Text('Borrow'),
  //                 onPressed: () async {
  //                   final String propertyNum = _propertyNumController.text;
  //                   final String description = _descriptionController.text;
  //                   final String acquisitionDate =
  //                       _acquisitionDateController.text;
  //                   final String estimdatedLife = _estimatedLifeController.text;
  //                   final String officeDesignation =
  //                       _officeDesignationController.text;
  //                   final String brandSerialNum =
  //                       _brandSerialNumController.text;
  //                   if (description != null && propertyNum != null) {
  //                     await _items.add({
  //                       "propertyNum": propertyNum,
  //                       "description": description,
  //                       "acquisitionDate": acquisitionDate,
  //                       "estimatedLife": estimdatedLife,
  //                       "officeDesignation": officeDesignation,
  //                       "brandSerialNum": brandSerialNum,
  //                     });

  //                     _propertyNumController.text = '';
  //                     _descriptionController.text = '';
  //                     _acquisitionDateController.text = '';
  //                     _estimatedLifeController.text = '';
  //                     _officeDesignationController.text = '';
  //                     _brandSerialNumController.text = '';
  //                     Navigator.of(context).pop();
  //                   }
  //                 },
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }

  Future<void> _addBorrowItem([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _propertyNumController.text = documentSnapshot['propertyNum'];
      _descriptionController.text = documentSnapshot['description'];
      _acquisitionDateController.text = documentSnapshot['acquisitionDate'];
      _estimatedLifeController.text = documentSnapshot['estimatedLife'];
      _officeDesignationController.text = documentSnapshot['officeDesignation'];
      _brandSerialNumController.text = documentSnapshot['brandSerialNum'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _propertyNumController,
                  decoration: const InputDecoration(labelText: 'propertyNum'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'description'),
                ),
                TextField(
                  controller: _acquisitionDateController,
                  decoration:
                      const InputDecoration(labelText: 'acquisitionDate'),
                ),
                TextField(
                  controller: _estimatedLifeController,
                  decoration: const InputDecoration(labelText: 'estimatedLife'),
                ),
                TextField(
                  controller: _officeDesignationController,
                  decoration:
                      const InputDecoration(labelText: 'officeDesignation'),
                ),
                TextField(
                  controller: _brandSerialNumController,
                  decoration:
                      const InputDecoration(labelText: 'brandSerialNum'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Borrow'),
                  onPressed: () async {
                    final String propertyNum = _propertyNumController.text;
                    final String description = _descriptionController.text;
                    final String acquisitionDate =
                        _acquisitionDateController.text;
                    final String estimdatedLife = _estimatedLifeController.text;
                    final String officeDesignation =
                        _officeDesignationController.text;
                    final String brandSerialNum =
                        _brandSerialNumController.text;
                    if (description != null) {
                      await _borrowedItems.add({
                        "propertyNum": propertyNum,
                        "description": description,
                        "acquisitionDate": acquisitionDate,
                        "estimatedLife": estimdatedLife,
                        "officeDesignation": officeDesignation,
                        "brandSerialNum": brandSerialNum,
                      });
                      _propertyNumController.text = '';
                      _descriptionController.text = '';
                      _acquisitionDateController.text = '';
                      _estimatedLifeController.text = '';
                      _officeDesignationController.text = '';
                      _brandSerialNumController.text = '';
                      Navigator.of(context).pop();
                    }
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text('Item added to list of borrowed items.')));
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String itemId) async {
    await _items.doc(itemId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You have successfully deleted an item')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Borrow item'),
      ),
      body: StreamBuilder(
        stream: _items.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['propertyNum']),
                    subtitle: Text(documentSnapshot['description']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.archive_outlined),
                              onPressed: () => {
                                    _addBorrowItem(documentSnapshot),
                                    print(documentSnapshot[
                                        'propertyNum']), //terminal
                                    print(documentSnapshot['description'])
                                  }),
                          // IconButton(
                          //   icon: const Icon(Icons.archive_outlined),
                          //   onPressed: () => {
                          //     addBorrowItem(),
                          //     print(documentSnapshot['propertyNum']), //terminal
                          //     print(documentSnapshot['description'])
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
// Add new item
    );
  }
}
