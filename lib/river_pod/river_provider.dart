import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_template/river_pod/river_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RiverProvider<T extends RiverNotifier<G>, G>
    extends ConsumerStatefulWidget {
  const RiverProvider({super.key});

  T createProvider(WidgetRef ref);

  Widget build(BuildContext context, G provider, T notifier);

  @override
  ConsumerState createState() => RiverProviderState<T, G>();
}

class RiverProviderState<T extends RiverNotifier<G>, G>
    extends ConsumerState<RiverProvider> {
  @protected StateNotifierProvider<T, G>? riverProvider;

  @override
  void initState() {
    riverProvider =
        StateNotifierProvider<T, G>((r) => widget.createProvider(ref) as T);
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