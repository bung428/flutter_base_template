import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_template/river_pod/river_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RiverProvider<T extends RiverNotifier<G>, G>
    extends ConsumerStatefulWidget {
  const RiverProvider({super.key});

  T createProvider(List<Object>? repos);

  List<Object>? setRepository();

  Widget build(BuildContext context, G provider, T notifier);

  @override
  ConsumerState createState() => RiverProviderState<T, G>();
}

class RiverProviderState<T extends RiverNotifier<G>, G>
    extends ConsumerState<RiverProvider> {
  @protected StateNotifierProvider<T, G>? riverProvider;
  @protected List<Provider>? repositories;

  @override
  void initState() {
    if (widget.setRepository()?.isNotEmpty == true) {
      final list = widget.setRepository()!;
      repositories = list.map((Object e) => Provider((ref) => e)).toList();
    }
    riverProvider =
        StateNotifierProvider<T, G>((r) => widget.createProvider(repositories) as T);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final riverProvider = this.riverProvider;
    if (riverProvider != null) {
      final provider = ref.watch(riverProvider);
      final notifier = ref.watch(riverProvider.notifier);

      return _buildProviderWidget(
          context,
          widget.build(context, provider, notifier)
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildProviderWidget(BuildContext context, Widget widget) => widget;
}