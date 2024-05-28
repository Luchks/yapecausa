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
/////*********************************************************************/
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tools Bar'),
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
              return Dismissible(
                onDismissed: (direction) async {
                  await deletePeople(snapshot.data![index]['uid']).then((_) {
                    snapshot.data!.removeAt(index);
                  });
                },
                confirmDismiss: (direction) async {
                  bool result = false;
                  result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                              "Are you sure ${snapshot.data![index]['name']} ?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  return Navigator.pop(context, false);
                                },
                                child: const Text('Cancel',
                                    style: TextStyle(color: Colors.red))),
                            TextButton(
                                onPressed: () {
                                  return Navigator.pop(context, true);
                                },
                                child: const Text("Yes, I'm sure")),
                          ],
                        );
                      });
                  print('Erraiser');
                  return result;
                },
                background: Container(
                    color: Colors.red, child: const Icon(Icons.delete)),
                direction: DismissDirection.endToStart,
                key: Key(snapshot.data![index]['uid']),
                child: ListTile(
                  onLongPress: () =>
		  print("Erraiser"), // here I'm going to delete
                  title: Text(snapshot.data![index]['name']+snapshot.data![index]['edge']),
                  onTap: (() async {
                    await Navigator.pushNamed(context, '/edit', arguments: {
                      'name': snapshot.data![index]['name'],
                      'edge': snapshot.data![index]['edge'],
                      'uid': snapshot.data![index]['uid'],
                    }).then((_) {
                      setState(() {});
                    });
                  }),
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add').then((_) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
