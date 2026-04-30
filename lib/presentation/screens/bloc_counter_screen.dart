import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter-bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child:const BuildCounterView());
  }
}

class BuildCounterView extends StatelessWidget {
  const BuildCounterView({
    super.key,
  });

  void increasedCounterBy (BuildContext context, [int value = 1]){
    context.read<CounterBloc>()
    .add(CounterIncreased(value));
  }

  void resetedCounter(BuildContext context){
    context.read<CounterBloc>()
    .add(CounterReset());
  }  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:context.select((CounterBloc counterbloc)=> Text('Bloc Counter ${counterbloc.state.transactionCount}')),
        actions: [
          IconButton(
            onPressed: () => {
              resetedCounter(context)
            }, 
            icon:const Icon(Icons.refresh_rounded)
            )
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc)=> Text('counter Value: ${counterBloc.state.counter}')) ,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () {   
              increasedCounterBy(context,3);         
          },
          ),
          const SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
    
            onPressed: () {  
               increasedCounterBy(context,2);          
          },
          ),
          const SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
    
            onPressed: () {     
               increasedCounterBy(context);       
          },
          ),
          
          ],
      ),
    );
  }
}