import 'package:hive_flutter/hive_flutter.dart';
import '../../model/categorys_home_screen_model.dart';
import '../../utils/hive_const.dart';

class HomeBloc {
  final box = Hive.box(DatabaseBoxConstant.storage);

  List<CategorysModel> listOfCategory = [
    CategorysModel(
      categoryName: "Math",
      image: "assets/images/math.png",
      questionNumbers: "10 Question",
      description: "The only way to learn mathematics is to do mathematics",
    ),
    CategorysModel(
      categoryName: "History",
      image: "assets/images/history.png",
      questionNumbers: "10 Question",
      description:
          "The more you know about the past, the better prepared you are for the future",
    ),
    CategorysModel(
      categoryName: "Sports",
      image: "assets/images/sports.png",
      questionNumbers: "10 Question",
      description:
          "Sports not only build better athletes but also better people",
    ),
    CategorysModel(
      categoryName: "Science",
      image: "assets/images/science.png",
      questionNumbers: "10 Question",
      description:
          "Science is the process that takes us from confusion to understanding",
    )
  ];
}
