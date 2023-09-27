class Question {

    Question(this.question,this.options);

    final String question;
    final List<String> options;

    List<String> getShuffledAnswers(){
      final shuffledList = List.of(options);
      // final doesnt allow the assigining of values again , once we have assigned the value for a final variable , it cant be changed !
      shuffledList.shuffle();
      return shuffledList;
    }
}