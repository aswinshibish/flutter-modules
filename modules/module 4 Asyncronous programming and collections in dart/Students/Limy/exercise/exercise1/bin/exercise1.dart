

void main() {
  Map<String,double> petPrices= { 
    'bella':10,
    'Lucy':0.8,
    'Loki':1.2,
    'Leo':2.0,
    'oggy':3.5,
  };
  double totalCost = petPrices.values.reduce((value,element)=>value+element);
  print('pet prices:${petPrices}');
  print('total cost:${totalCost.toStringAsFixed(2)}');

  
}
