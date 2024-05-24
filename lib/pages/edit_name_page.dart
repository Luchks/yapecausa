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
//edition of name by id
  @override
  Widget build(BuildContext context) {
	  final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
	  nameController.text = arguments['name'];
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
            ElevatedButton( 
		    onPressed: () async{
		    await updatePeople(arguments['uid'],nameController.text)
			.then((_){
				Navigator.pop(context);
			    });
	    }, 
		    child: const Text('Update'))
          ],
        ),
      ),
    );
  }
}
