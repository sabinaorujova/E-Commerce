import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits/home/home_cubit.dart';
import '../../../../cubits/home/home_state.dart';
import '../../widgets/global_widgets/global_loading.dart';

import '../widgets/buttons/title_appbar.dart';
import 'widgets/flashview.dart';

class FlashSalePage extends StatelessWidget {
  const FlashSalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleAppbar(
          title: ' Super Flash Sale',
          icon: Icons.arrow_back_ios,
          searchicon: Icons.search),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading || state is HomeInitial) {
                  return const GlobalLoading();
                } else if (state is HomeSuccess) {
                  return const FlashMegaView();
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
