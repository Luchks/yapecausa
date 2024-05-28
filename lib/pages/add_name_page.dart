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
	TextEditingController edgeController = TextEditingController(text:'');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
		controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter Name',
              ),
            ),
            TextField(
		controller: edgeController,
		decoration: const InputDecoration(
                hintText: 'Enter Edge',
              ),
            ),
            ElevatedButton( onPressed: () async{
		    await addPeople(nameController.text,edgeController.text).then((_){
			Navigator.pop(context);
		    });
	    }, 
		    child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
