void main(){
  // Maps key/value pairs
  var toppings = {"John": "Pepperoni","Mary":"Cheese"};
  print(toppings);
  print(toppings["John"]);

  // show values
  print(toppings.values);

  // show keys
  print(toppings.keys);

  // show length
  print(toppings.length);

  // Adding something to map
  toppings["Tim"]="Sausage";
  print(toppings);

  // Add many things
  toppings.addAll({"Tina":"Bacons","Steve": "Supreme"});
  print(toppings);

  // removing values
  toppings.remove("Steve");
  print(toppings);

  // clear()
  toppings.clear();
  print(toppings);



}