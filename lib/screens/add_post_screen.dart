import 'dart:ffi';
import 'dart:typed_data';

import 'package:b_dazzled/models/models.dart';
import 'package:b_dazzled/providers.dart/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);
  static const routeName = '/addPost';

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  String text = '';
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _captionController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey();
  Uint8List? _file;

  // var _newPost =
  //     // Product(id: '', title: '', description: '', imageUrl: '', price: 0)
  //     ;
  var _initValues = {
    'title': '',
    'description': '',
    'imageUrl': '',
    'price': '',
  };

  @override
  Widget build(BuildContext context) {
    // final User user = Provider.of<UserProvider>(context).getuser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('New Post'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.done,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Form(
              key: _form,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsets.only(top: 15, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                        ),
                        child: _imageUrlController.text.isEmpty
                            ? const Text('Image')
                            : FittedBox(
                                child: Image.network(_imageUrlController.text),
                                fit: BoxFit.cover,
                              ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    label: Text('Image URL'),
                                    border: InputBorder.none),
                                keyboardType: TextInputType.url,
                                textInputAction: TextInputAction.done,
                                controller: _imageUrlController,
                                focusNode: _imageUrlFocusNode,
                                // onFieldSubmitted: (_) => _saveForm,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter image URL';
                                  }
                                  if (!value.startsWith('http') &&
                                      !value.startsWith('https')) {
                                    return 'Enter a valid URL';
                                  }
                                  if (!value.endsWith('.png') &&
                                      !value.endsWith('.jpg') &&
                                      !value.endsWith('.jpeg')) {
                                    return 'Enter a valid image URL';
                                  }
                                  return null;
                                },
                                // onSaved: (value) {
                                //   _editedProduct = Product(
                                //       isFavorite: _editedProduct.isFavorite,
                                //       id: _editedProduct.id,
                                //       title: _editedProduct.title,
                                //       description: _editedProduct.description,
                                //       imageUrl: value!,
                                //       price: _editedProduct.price);
                                // },
                              ),
                            ),
                            TextButton.icon(
                                onPressed: () {
                                  // Uint8List file = await pickImage(
                                  // ImageSource.gallery,);
                                  // setState(() {
                                  //   _file = file;
                                  // });
                                },
                                icon: const Icon(Icons.photo),
                                label: const Text('Add image from gallery')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Write something',
                      border: InputBorder.none,
                    ),
                    controller: _captionController,
                    maxLines: 30,
                    keyboardType: TextInputType.multiline,
                    onSaved: (value) {
                      setState(() {
                        text = value!;
                      });
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
