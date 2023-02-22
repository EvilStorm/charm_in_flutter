import 'package:charmin/bloc/auth/bloc_auth.dart';
import 'package:charmin/bloc/auth/state_auth.dart';
import 'package:charmin/router/widget/circular_progress.dart';
import 'package:charmin/store/store_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignStateDisplay extends StatelessWidget {
  const SignStateDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Positioned.fill(
            child: CircularProgress(),
          );
        } else if (state is ErrorHasMesasge) {
          SnackBar snackBar = SnackBar(
            duration: const Duration(milliseconds: 800),
            behavior: SnackBarBehavior.floating,
            content: Text(
              state.message,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            backgroundColor: ColorStore.primaryColor,
          );
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        }
        return SizedBox.shrink();
      },
      listener: (context, state) {},
    );
  }
}
