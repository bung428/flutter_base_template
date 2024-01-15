import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RiverRepository {
  RiverRepository createRiverRepo();
  Provider<RiverRepository> setRiverRepoProvider() {
    return Provider((ref) => createRiverRepo());
  }
  // RiverRepository getRepoProvider(WidgetRef ref) => ref.watch(_setRiverRepoProvider());
}