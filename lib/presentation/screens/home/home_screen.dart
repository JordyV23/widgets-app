import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    appMenuItems[0];

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        return _CustomListTile(index: index);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        appMenuItems[index].icon,
        color: theme.primary,
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: theme.primary),
      title: Text(appMenuItems[index].title),
      subtitle: Text(appMenuItems[index].subTitle),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => const ButtonsScreen()),
        // );

        context.push(appMenuItems[index].link);

      },
    );
  }
}
