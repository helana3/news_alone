import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_alone/core/getit.dart';
import 'package:news_alone/presentation/views/home_view_body.dart';

import '../../domain/repo.dart';
import '../cubit_news_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(getIt<Repo>()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[100],
          title: Center(
              child: Text("News", style: TextStyle(color: Colors.black),)),
          elevation: 0,
          shadowColor: Colors.deepOrange.shade200,
        ),
        body: HomeViewBody(),
      ),
    );
  }
}

