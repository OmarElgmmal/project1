import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit.dart';
import 'model.dart';
import 'states.dart';
part 'item.dart';


class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit()..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Movies",
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<MoviesCubit, MoviesStates>(
          buildWhen: (previous, current) => current is! GetMoviesFromPaginationLoadingState && current is! GetMoviesFromPaginationFailedState,
            builder: (context, state) {
              if(state is GetMovieIsLoadingState){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if(state is GetMovieFailedState){
                return Center(child: Text(state.msg),
                );
              } else if(state is GetMovieSuccessState){
                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    //print(notification);
                    if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification)
                    {
                      print("loading");
                      MoviesCubit cubit = BlocProvider.of(context);
                      cubit.getData(paginationLoading: true);
                    }
                    return true;
                  },
                  child: ListView.separated(
                    padding: const EdgeInsetsDirectional.all(16),
                    itemBuilder: (context, index) =>
                        _Item(
                          model: state.list[index],
                        ),
                    separatorBuilder: (context, index) =>
                    const SizedBox(
                      height: 16,
                    ),
                    itemCount: state.list.length,
                  ),
                );
              }else{
                return const Text("Un Handled State");
              }

            },
        ),
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            height: 60,
            child: BlocBuilder<MoviesCubit,MoviesStates>(
              buildWhen: (previous, current) => current is GetMoviesFromPaginationLoadingState|| current is GetMovieSuccessState || current is GetMoviesFromPaginationFailedState,
              builder: (context, state) {
                if(state is GetMoviesFromPaginationLoadingState)
                {
                  return const Center(child: CircularProgressIndicator());
                } else if(state is GetMoviesFromPaginationFailedState)
                {
                  return Center( child: Text(state.msg,));
                } else
                {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

