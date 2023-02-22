import 'package:charmin/bloc/password/bloc_password.dart';
import 'package:charmin/bloc/password/state_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordValidation extends StatelessWidget {
  PasswordValidation({super.key});

  ValidationState? prevState;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordBloc, PasswordCheckState>(
      builder: (context, state) {
        if (state is ValidationState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: state.steps
                .map((e) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 5,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(40),
                              ),
                              color: e.isOk ? Colors.green : Colors.red),
                        ),
                        Text(
                          e.validation,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: e.isOk ? Colors.green : Colors.red),
                        ),
                      ],
                    ))
                .toList(),
          );
        }
        return const SizedBox.shrink();
      },
      listener: (context, state) {},
      buildWhen: (previous, current) {
        if (current is ValidationState) {
          if (prevState == null) {
            prevState = current;
            return true;
          }

          int length = prevState!.steps.length;
          for (int i = 0; i < length; i++) {
            if (prevState!.steps.elementAt(i) != current.steps.elementAt(i)) {
              prevState = current;
              return true;
            }
          }
        }
        return false;
      },
    );
  }
}
