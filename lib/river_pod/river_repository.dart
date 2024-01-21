import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RiverRepository {
  RiverRepository() {
    init();
  }

  void init() {}

  RiverRepository createRiverRepo();
  Provider<RiverRepository> _setRiverRepoProvider() {
    return Provider((ref) => createRiverRepo());
  }
  RiverRepository getRepoProvider(WidgetRef ref) => ref.watch(_setRiverRepoProvider());
}