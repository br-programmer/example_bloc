import 'package:example_flutterbloc/bloc/count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountScreen extends StatelessWidget {
  const CountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this);
    return BlocProvider(
      create: (_) => CountBLoC(),
      child: Scaffold(
        appBar: AppBar(title: Text('Count Example Bloc')),
        body: const Value(),
        floatingActionButton: AddRemove(),
      ),
    );
  }
}

class AddRemove extends StatelessWidget {
  const AddRemove({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Add(), SizedBox(height: 10), Remove()],
    );
  }
}

class Remove extends StatelessWidget {
  const Remove({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this);
    return FloatingActionButton(
      onPressed: () => context.read<CountBLoC>().add(RemoveEvent()),
      child: Icon(Icons.remove),
    );
  }
}

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this);
    return FloatingActionButton(
      onPressed: () => context.read<CountBLoC>().add(AddEvent()),
      child: Icon(Icons.add),
    );
  }
}

class Value extends StatelessWidget {
  const Value({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this);
    return Center(
      child: BlocSelector<CountBLoC, int, int>(
        selector: (state) => state,
        builder: (context, value) {
          print('Selector');
          return Text(
            '$value',
            style: TextStyle(fontSize: 100),
          );
        },
      ),
    );
  }
}
