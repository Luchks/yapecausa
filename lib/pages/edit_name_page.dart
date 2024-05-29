import 'package:yapecausa/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({
    Key? key,
  }) : super(key: key);
  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
	TextEditingController nameController = TextEditingController(text:'');
	TextEditingController edgeController = TextEditingController(text:'');
	TextEditingController mountController = TextEditingController(text:'');
//edition of name by id
  @override
  Widget build(BuildContext context) {
	  final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
	  nameController.text = arguments['name'];
	  edgeController.text = arguments['edge'];
	  mountController.text = arguments['mount'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
		controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Edit name please',
              ),
            ),
            TextField(
		controller: edgeController,
              decoration: const InputDecoration(
                hintText: 'Edit edge please',
              ),
            ),
	    TextField(
		controller: mountController,
              decoration: const InputDecoration(
                hintText: 'Edit Mount please',
              ),
            ),
            ElevatedButton( 
		    onPressed: () async{
		    await updatePeople(arguments['uid'],nameController.text,edgeController.text,mountController.text)
			.then((_){
				Navigator.pop(context);
			    });
	    }, 
		    child: const Text('Update')
		)
          ],
        ),
      ),
    );
  }
}
