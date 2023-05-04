import 'package:cat_trivia/data/consts/api_constants.dart';
import 'package:cat_trivia/domain/interactor/cat_interactor.dart';
import 'package:cat_trivia/presentation/bloc/cat_bloc/cat_bloc.dart';
import 'package:cat_trivia/presentation/di/configure_dependencies.dart';
import 'package:cat_trivia/presentation/screen/fact_history/facts_history_screen.dart';
import 'package:cat_trivia/presentation/screen/widgets/error_widget.dart';
import 'package:cat_trivia/presentation/screen/widgets/fact_card.dart';
import 'package:cat_trivia/presentation/screen/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactScreen extends StatelessWidget {
  const CatFactScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = CatBloc(getIt<CatInteractor>());
    return BlocProvider<CatBloc>(
      lazy: true,
      create: (context) => bloc..add(const CatEvent.fetchCatFact()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Cat Trivia'),
          ),
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.refresh),
              onPressed: () {
                bloc.add(const CatEvent.fetchCatFact());
              }),
          body: BlocBuilder<CatBloc, CatState>(
            builder: ((context, state) => state.maybeWhen(
                  success: (cat) => Column(
                    children: [
                      FactCard(fact: cat.fact, createdDate: cat.createdDate),
                      const CatImage(),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) => const FactHistoryScreen()),
                            );
                          },
                          child: const Text('Fact history')),
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

class CatImage extends StatelessWidget {
  const CatImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      ApiConstants.catImageUrl,
      width: double.infinity,
      height: 400,
      fit: BoxFit.cover,
    );
  }
}
