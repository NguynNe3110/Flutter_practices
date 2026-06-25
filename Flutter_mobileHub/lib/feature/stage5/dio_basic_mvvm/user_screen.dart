import 'package:flutter/material.dart';
import 'package:flutter_mobilehub/feature/stage5/dio_basic_mvvm/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UsersScreen2 extends ConsumerStatefulWidget {
  const UsersScreen2({super.key});

  @override
  ConsumerState<UsersScreen2> createState() =>
      _UsersScreenState();
}

class _UsersScreenState
    extends ConsumerState<UsersScreen2> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(usersNotifierProvider.notifier)
          .loadUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(usersNotifierProvider);

    if (state.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.builder(
        itemCount: state.users.length,
        itemBuilder: (context, index) {
          final user = state.users[index];

          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
    );
  }
}