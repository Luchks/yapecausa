import 'package:yapecausa/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({
    Key? key,
  }) : super(key: key);
  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
	TextEditingController nameController = TextEditingController(text:'');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
		controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter Name',
              ),
            ),
            ElevatedButton( onPressed: () async{
		    await addPeople(nameController.text);
	    }, 
		    child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
