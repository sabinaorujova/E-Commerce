import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/register/register_cubit.dart';
import '../../../../widgets/global_widgets/global_input.dart';
import '../../../../../../utils/constants/app_text.dart';


class FullNameInputs extends StatelessWidget {
  const FullNameInputs({super.key});

  @override
  Widget build(BuildContext context) {
        final cubit =context.read<RegisterCubit>();

    return  GlobalInput(
      hintText: AppTexts.fullName,
      prefixIcon: Icons.person_2_outlined,
      controller: cubit.fullNameController,
      validate: (v) {
          if (v == '') {
            return 'Field cannot be empty';
          }
          return null;
        },
    );
  }
}
