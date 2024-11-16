import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reiverpod_tutorial/fetchield_meal_provider.dart';
import 'package:reiverpod_tutorial/main.dart';
import 'package:reiverpod_tutorial/model/meal_model.dart';
import 'package:reiverpod_tutorial/screens/postpage.dart';

class Datashowpage extends ConsumerWidget {
  const Datashowpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);
    final getAllUser = ref.watch(getUserProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title:  Text("Data with model without model",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
        leading:IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
        }, icon: Icon(Icons.home)) ,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PostListScreen()));
          }, icon: Icon(Icons.arrow_forward,color: Colors.black,))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.green,
          child: getAllUser.when(
            data: (data) => Form(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onChanged: (value) {},
                        onEditingComplete: () {},
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: data['data'].length,
                          itemBuilder: (context, index) {
                            final user = data['data'][index];
                            return ListTile(
                              title: Text(
                                  '${user['first_name']} ${user['last_name']}'),
                              subtitle: Text(user['email']),
                              leading: CircleAvatar(
                                maxRadius: 30,
                                backgroundImage: NetworkImage(user['avatar']),
                              ),
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
            error: (error, stackTrace) => const SizedBox(
              height: double.infinity,
              child: Center(
                child: Text('Something went wrong'),
              ),
            ),
            loading: () => const SizedBox(
              child: Center(
                child: CircularProgressIndicator(strokeWidth: 2,),
              ),
            ),
          ),)),
          Expanded(child: Container(
            color: Colors.orange,
          child: userAsyncValue.when(
            data: (data) =>Form(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final user = data[index];
                    return ListTile(
                        title: Text(
                            '${user.name}'),
                        subtitle: Text(user.email.toString()),
                        leading: Text(user.id.toString())
                    );
                  },
                ),
              ),
            ),
            error: (error, stackTrace) => const SizedBox(
              height: double.infinity,
              child: Center(
                child: Text('Something went wrong'),
              ),
            ),
            loading: () => const SizedBox(
              child: Center(
                child: CircularProgressIndicator(strokeWidth: 2,),
              ),
            ),
          ),)),

        ],
      )
    );
  }
}
