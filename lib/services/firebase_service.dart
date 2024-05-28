import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db= FirebaseFirestore.instance;

Future<List> getPeople() async{
	List people=[];
	//trae todo, asi que aqui se debe hacer un exception.
	CollectionReference collectionReferencePeople = db.collection('people');
	QuerySnapshot queryPeople = await collectionReferencePeople.get();
	for(var doc in queryPeople.docs){
		final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
		final person = {
			'name': data['name'],
			'edge': data['edge'],
			'uid': doc.id
		};
		people.add(person);
	};
	return people;
}

Future<void> addPeople(String name,String edge) async{
	await db.collection('people').add({'name':name,'edge':edge});
}

Future<void> updatePeople(String uid, String name,String edge) async{
	await db.collection('people').doc(uid).update({'name':name,'edge':edge});
}

Future<void> deletePeople(String uid) async{
	await db.collection('people').doc(uid).delete();
}
