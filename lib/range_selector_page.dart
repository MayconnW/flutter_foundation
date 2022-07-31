import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_page.dart';
import 'package:flutter_foundations/range_selector_form.dart';

class RandomSelectorPage extends StatefulWidget {
  const RandomSelectorPage({Key? key}) : super(key: key);

  @override
  State<RandomSelectorPage> createState() => _RandomSelectorPageState();
}

class _RandomSelectorPageState extends State<RandomSelectorPage> {
  final _formKey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: _formKey,
        minValueSetter: (value) => _min = value,
        maxValueSetter: (value) => _max = value,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          onPressed: () {
            if (_formKey.currentState?.validate() == true) {
              _formKey.currentState?.save();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RandomizerPage(min: _min, max: _max),
                ),
              );
            }
          }),
    );
  }
}
