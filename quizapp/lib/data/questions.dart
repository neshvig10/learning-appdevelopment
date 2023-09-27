import 'package:quizapp/model/quiz_questions.dart';


final questions = [
  Question('What are the basic building blocks of Flutter ?', ['Widgets','Blocks','Components', 'Function']),
  Question('How are flutter UIs built ?', ['By combining Widgets in code','By combining Widgets in visual editor','By defining widgets in config files', 'By using XCode and iOS and Android studio']),
  Question('What is the purpose of a Stateful widget ?', ['Update UI as data changes','Update data as UI changes','Ignore data changes', 'Render UI that does not depend on data']),
  Question('What happens if you change data in a StatelessWidget?',['The UI is not updated','The UI is updated','The closest StatefulWidget is updated','Any nested StatefulWidgets are updated',],),
  Question('How should you update data inside of StatefulWidgets?',['By calling setState()','By calling updateData()','By calling updateUI()','By calling updateState()',],) 
];


