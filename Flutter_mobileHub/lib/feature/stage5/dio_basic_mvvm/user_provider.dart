



import 'package:flutter_mobilehub/feature/stage5/dio_basic_mvvm/user_notifier.dart';
import 'package:flutter_mobilehub/feature/stage5/dio_basic_mvvm/user_remote_data_source.dart';

import 'app_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'user_api.dart';
import 'user_repository.dart';
import 'user_repository_impl.dart';
import 'users_state.dart';
//lafm tungwf buowsc giosng hoi khoi tao hitl thu cogn o project Ban ve & su kien

//api
final userApiProvider = Provider<UserApi>( (ref) {
  // lấy dio từ app_provider
  final dio = ref.read(dioProvider);
  // gọi factory contructor của retrofit de tao instance
  // giong kieu constructor
  return UserApi(dio);
});

//data source
final userRemoteDataSourceProvier = Provider<UserRemoteDataSource>((ref) {
  final userApi = ref.read(userApiProvider);

  return UserRemoteDataSource(userApi);
});


// repo
final repositoryProvider = Provider<UserRepository>((ref) {

  final remoteDataSource = ref.read(userRemoteDataSourceProvier);
  // ban than cua no that ra la impl nen phai khoi tao la impl
  return UserRepositoryImpl(remoteDataSource);
});

// notifier
final usersNotifierProvider = StateNotifierProvider<UsersNotifier, UsersState> ((ref) {
  // nhugn cai khac de theo doi lan dau thoi, con cai nay phai rebuild ui len phai la watch(theo doi lien tuc)
  final repository = ref.watch(repositoryProvider);
  return UsersNotifier(repository);
});