

void main(List<String> arguments) {
 Map<String,double> petPrice={
  'milk':20.3,
  'gold':40.21,
 };
 double toprice= petPrice.values.reduce((values,elements)=>values-elements);
 print('petname:${petPrice}');
 print('price:${toprice.toStringAsFixed(2)}');
}
