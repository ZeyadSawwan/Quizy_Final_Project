class ResultBloc {
  List<String> collectionName = [
    "quiz2",
    "quiz1",
    "quiz4",
    "quiz3",
  ];
  String calculateThePercentageOfCorrectAnswers(listOfQuestions, score) {
    return (score / listOfQuestions.length * 100).toString();
  }
}
