import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page/utils/constants/padding.dart';

import '../../../../cubits/home/home_cubit.dart';
import '../../../../cubits/home/home_state.dart';
import '../../widgets/global_widgets/global_loading.dart';
import '../flash_sale/widgets/flashview.dart';
import '../widgets/buttons/title_appbar.dart';


class MegaSalePage extends StatelessWidget {
  const MegaSalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleAppbar(
          title: ' Mega Flash Sale',
          icon: Icons.arrow_back_ios,
          searchicon: Icons.search),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: AppPaddings.a16,
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
