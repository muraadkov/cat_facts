import 'package:cat_trivia/domain/interactor/cat_interactor.dart';
import 'package:cat_trivia/presentation/bloc/fact_history_bloc/fact_history_bloc.dart';
import 'package:cat_trivia/presentation/di/configure_dependencies.dart';
import 'package:cat_trivia/presentation/screen/widgets/error_widget.dart';
import 'package:cat_trivia/presentation/screen/widgets/fact_card.dart';
import 'package:cat_trivia/presentation/screen/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactHistoryScreen extends StatelessWidget {
  const FactHistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = FactHistoryBloc(getIt<CatInteractor>());
    return BlocProvider<FactHistoryBloc>(
      lazy: true,
      create: (context) => bloc..add(const FactHistoryEvent.getFactHistory()),
      child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<FactHistoryBloc, FactHistoryState>(
            builder: ((context, state) => state.maybeWhen(
                  success: (cat) => Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: FactCard(
                                  fact: cat[index].fact, createdDate: cat[index].createdDate),
                            );
                          },
                          shrinkWrap: true,
                          itemCount: cat.length,
                        ),
                      )
                    ],
                  ),
                  loading: () => const Center(
                      child: LoadingIndicator(
                    color: Colors.blueAccent,
                    width: 40,
                    height: 40,
                  )),
                  error: (error) => const CustomErrorWidget(),
                  orElse: () => const SizedBox(),
                )),
          )),
    );
  }
}
