import 'package:flutter/material.dart';
import 'package:flutter_mobilehub/feature/stage5/dio_first/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'users_notifier.dart';

// Map sang Kotlin: @Composable fun UsersScreen() hoặc class UsersFragment : Fragment()
class UsersScreen extends ConsumerStatefulWidget {
  const UsersScreen({super.key});

  @override
  ConsumerState<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends ConsumerState<UsersScreen> {
  @override
  void initState() {
    super.initState();
    // Gọi API khi màn hình mở (Map sang LaunchedEffect trong Compose)
    Future.microtask(() => ref.read(usersProvider.notifier).fetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    // Lắng nghe state (Map sang val state by viewModel.uiState.collectAsState())
    final state = ref.watch(usersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách User')),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(UsersState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator()); // Map: Loading state
    }
    if (state.error != null) {
      return Center(child: Text('Lỗi: ${state.error}')); // Map: Error state
    }
    if (state.users == null || state.users!.isEmpty) {
      return const Center(child: Text('Không có dữ liệu'));
    }

    // Map sang Kotlin: LazyColumn (Compose) hoặc RecyclerView (XML)
    return ListView.builder(
      itemCount: state.users!.length,
      itemBuilder: (context, index) {
        final user = state.users![index];
        return ListTile(
          leading: CircleAvatar(child: Text(user.id.toString())),
          title: Text(user.name),
          subtitle: Text(user.email),
        );
      },
    );
  }
}