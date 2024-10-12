import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_alone/presentation/cubit_news_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  void initState() {
    super.initState();
    // استدعاء fetchNewsData عند بدء التشغيل
    BlocProvider.of<NewsCubit>(context).fetchNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(

      builder: (context, state) {
        if(state is NewsLoading){
          return Center(child: CircularProgressIndicator());
        }


        else if(state is NewsSuccess){
          final entities=state.entities;
          return GridView.builder(
            itemBuilder: (context, index) {
              final entity = entities[index];
              return Container(
                color: Colors.blue[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      entity.image, width: 200, height: 80,),
                    SizedBox(height: 10),
                    Text(entity.articleName, style: TextStyle(fontSize: 15),maxLines: 1,),
                    Text(entity.autherName, style: TextStyle(fontSize: 15),maxLines: 1,),
                    Text(entity.description, style: TextStyle(fontSize: 10,color: Colors.grey),maxLines: 2,),
                  ],
                ),
              );
            },
            itemCount: entities.length,
            padding: EdgeInsets.all(20), // مسافة خارجية حول الشبكة
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عدد الأعمدة
              mainAxisSpacing: 20, // المسافة بين الصفوف
              crossAxisSpacing: 20, // المسافة بين الأعمدة
            ),


          );
        }else if(state is NewsFailure){
            return Center(child: Text(state.errMessage));
          }
        return Center(child: Text('Welcome!'));
        }


    );
  }
}
