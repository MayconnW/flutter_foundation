import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_page.dart';
import 'package:flutter_foundations/range_selector_form.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomSelectorPage extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  RandomSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: _formKey,
        minValueSetter: (value) => min.value = value,
        maxValueSetter: (value) => max.value = value,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          onPressed: () {
            if (_formKey.currentState?.validate() == true) {
              _formKey.currentState?.save();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      RandomizerPage(min: min.value, max: max.value),
                ),
              );
            }
          }),
    );
  }
}
