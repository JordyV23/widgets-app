import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String name = 'buttons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          // crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Elevated")),
            const ElevatedButton(onPressed: null, child: Text("Elevated Disabled")),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm_rounded), label: const Text("Elevated Icons")),
            FilledButton(onPressed: (){}, child: const Text("Filled")),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.javascript_rounded), label: const Text("Filled Icons")),
            OutlinedButton(onPressed: (){}, child: const Text("Outline")),
            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.terminal) , label: const Text("Outline Icons BTN")),
            TextButton(onPressed: (){}, child: const Text("Text BTN")),
            TextButton.icon(onPressed: (){}, label: const Text("Text BTN"), icon: const Icon(Icons.account_balance)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.ac_unit_sharp), style: ButtonStyle( backgroundColor: MaterialStatePropertyAll(color.primary), iconColor: const MaterialStatePropertyAll(Colors.white) ),)



          ],
        ),
      ),
    );
  }
}
