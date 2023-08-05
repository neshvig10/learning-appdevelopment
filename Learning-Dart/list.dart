void main(){
  // Lists 
  var myList = [1,2,3];
  print(myList);
  print(myList[0]);

  // Change an Item
  myList[0]=41;
  print(myList);

  // add Item
  myList.add(32);
  print(myList);

  // add multiple items 
  myList.addAll([3,4,5]);
  print(myList);

  // insert at specific position
  myList.insert(3, 900);
  print(myList);

  // insert multiple elements at a position
  myList.insertAll(2, [43,55]);
  print(myList);

  // mixed list
  var mixedList = [1,2,3,"John","Doe"];
  print(mixedList);

  // removing elements 
  mixedList.remove("John");
  print(myList);

  // removing with index
  mixedList.removeAt(2);
  print(myList);


}