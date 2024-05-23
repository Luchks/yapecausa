import 'package:yapecausa/services/firebase_service.dart';
import 'package:flutter/material.dart';
///remplazar aqui por favor soy el add. ADD
///$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$444

class  AddNamePage extends StatefulWidget{
	const AddNamePage({
		Key? key,
	}) : super(key:key);
	@override
	State<AddNamePage> createState() => _AddNamePageState();
}
/////********************************************************************8*/
class  _AddNamePageState extends State<AddNamePage>{

	@override
	Widget build(BuildContext context){
		return Scaffold(
		       appBar: AppBar(
			      title: const Text('barra de herrmainetas'), 
		       ), 
		       body: FutureBuilder(
			       future: getPeople(),
			       builder:((context,snapshot){
					      if(!snapshot.hasData){ return const Center(child: CircularProgressIndicator());}
					      return ListView.builder(
						      itemCount: snapshot.data!.length,
						      itemBuilder: (context, index){
								      return Text(snapshot.data![index]['name']);
							      } ,
						      )	; 
				       }
				  ) ,
			       ),
		);
	}
}
/////********************************************************************8*/
