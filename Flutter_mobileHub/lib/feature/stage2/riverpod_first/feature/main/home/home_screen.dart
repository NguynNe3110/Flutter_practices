import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_viewmodel.dart';

// Lưu ý: Dùng ConsumerWidget thay vì StatelessWidget để có WidgetRef
class HomeScreenst2 extends ConsumerWidget {
  const HomeScreenst2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch: Lắng nghe sự thay đổi của Provider.
    // Khi state thay đổi, hàm build() của Widget này sẽ chạy lại (Rebuild).
    // Tương đương: val state by viewModel.state.collectAsStateWithLifecycle()
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Riverpod'),
        actions: [
          // Nút Refresh
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // ref.read: Chỉ đọc 1 lần, KHÔNG lắng nghe sự thay đổi.
              // Dùng khi gọi hàm action (giống bấm nút trong Compose).
              ref.read(homeViewModelProvider.notifier).refresh();
            },
          )
        ],
      ),
      body: Center(
        // state.when: Tương đương when(state) { is Loading -> ..., is Error -> ... }
        child: state.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lỗi: $error', style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(homeViewModelProvider.notifier).refresh(),
                child: const Text('Thử lại'),
              )
            ],
          ),
          data: (users) => ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(users[index]),
                leading: const Icon(Icons.person),
              );
            },
          ),
        ),
      ),
    );
  }
}