import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'newpage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Riverpod Tutorials',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Datashowpage(),
    );
  }
}


final helloworldProvider =  Provider((ref)=>
'sdsfsf  ......');

final counterStateProvider = StateProvider<int>((ref){
  int count = 0;
  return count;
});


class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final String value = ref.read(helloworldProvider);
    final counterProvider = ref.watch(counterStateProvider);
    
    return  Scaffold(
      body : Center(
        child: Text(counterProvider.toString(),style: const TextStyle(
          fontSize: 25
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read(counterStateProvider.notifier).state++;
      },child: Icon(Icons.add),),
    );
  }
}
