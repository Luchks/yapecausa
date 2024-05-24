import 'package:yapecausa/services/firebase_service.dart';
import 'package:flutter/material.dart';

///$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$444

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

/////********************************************************************8*/
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('barra de herrmainetas'),
      ),
      body: FutureBuilder(
        future: getPeople(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
		    return ListTile(
			    title: Text(snapshot.data![index]['name']),
			    onTap: (() async {
				   await Navigator.pushNamed(context,'/edit',arguments: {
					    'name':snapshot.data![index]['name'],
					    'uid':snapshot.data![index]['uid'],
				   }).then((_){
					setState((){});
				   });
			    }),
		    ); 
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
		await Navigator.pushNamed(context, '/add').then((_){
			setState((){});
		});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
/////********************************************************************8*/
