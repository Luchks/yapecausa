import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db= FirebaseFirestore.instance;

Future<List> getPeople() async{
	List people=[];
	//trae todo, asi que aqui se debe hacer un exception.
	CollectionReference collectionReferencePeople = db.collection('people');
	QuerySnapshot queryPeople = await collectionReferencePeople.get();
	queryPeople.docs.forEach((document){
		people.add(document.data());
	});
	return people;
}

Future<void> addPeople(String name) async{
	await db.collection('people').add({'name':name});
}
