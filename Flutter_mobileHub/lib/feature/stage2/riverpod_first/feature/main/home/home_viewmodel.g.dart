// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepositoryHash() => r'f81322ed8d53808a1a51e8bee4f0e6a53f50b19d';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
String _$homeViewModelHash() => r'b8bb1405557df379671f6c7fc87308715559d64f';

/// See also [HomeViewModel].
@ProviderFor(HomeViewModel)
final homeViewModelProvider =
    AutoDisposeAsyncNotifierProvider<HomeViewModel, List<String>>.internal(
  HomeViewModel.new,
  name: r'homeViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeViewModel = AutoDisposeAsyncNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
