import 'package:yapecausa/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp(
		options: DefaultFirebaseOptions.currentPlatform,
		);
	  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
       home:Home(),
    );
  }
}
class  Home extends StatefulWidget{
	const Home({
		Key? key,
	}) : super(key:key);
	@override
	State<Home> createState() => _HomeState();


}
/////********************************************************************8*/
class  _HomeState extends State<Home>{

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
