import 'dart:io';

double calculateDiscount(double totalCost, double discount) {
  return totalCost * (discount / 100);
}

double convertToRiel(double amountUSD, double conversionRate) {
  return amountUSD * conversionRate;
}

void main() {
  const double conversionRate = 4100; // Conversion rate from USD to KHR
  List<Map<String, dynamic>> products = [];
  int idCounter = 1;
  double totalGrandUSD = 0.0;
  double totalGrandKHR = 0.0;

  while (true) {
    stdout.write('Enter Product Name: ');
    String? name = stdin.readLineSync();
    if (name == null || name.toLowerCase() == 'done') {
      break;
    }

    stdout.write('Enter Product Quantity: ');
    int qty = int.parse(stdin.readLineSync()!);

    stdout.write('Enter Product Price (USD): ');
    double price = double.parse(stdin.readLineSync()!);
    double priceKHR = convertToRiel(price, conversionRate);

    stdout.write('Enter Product Discount (%): ');
    double discount = double.parse(stdin.readLineSync()!);


    double totalCostUSD = qty * price;


    double discountAmountUSD = calculateDiscount(totalCostUSD, discount);


    double finalCostUSD = totalCostUSD - discountAmountUSD;


    double finalCostKHR = convertToRiel(finalCostUSD, conversionRate);


    totalGrandUSD += finalCostUSD;
    totalGrandKHR += finalCostKHR;


    products.add({
      'id': idCounter,
      'name': name,
      'qty': qty,
      'priceUSD': price,
      'priceKHR': priceKHR,
      'discount': discount,
      'finalCostUSD': finalCostUSD,
      'finalCostKHR': finalCostKHR,
    });


    idCounter++;

    stdout.write('Do you want to enter another product? (yes/no): ');
    String? continueInput = stdin.readLineSync();
    if (continueInput == null || continueInput.toLowerCase() != 'yes') {
      break;
    }
  }


  print('\n===============================================================================');
  print('| ID | Name         | Quantity | Price (USD) | Price (KHR)    | Discount (%) | Subtotal (USD) | Subtotal (KHR)   |');
  for (var product in products) {
    print('| ${product['id'].toString().padLeft(2)} | ${product['name'].padRight(12)} | ${product['qty'].toString().padLeft(8)} | ${product['priceUSD'].toStringAsFixed(2).padLeft(11)} | ${product['priceKHR'].toStringAsFixed(0).padLeft(13)} | ${product['discount'].toString().padLeft(12)}% | ${product['finalCostUSD'].toStringAsFixed(2).padLeft(13)} | ${product['finalCostKHR'].toStringAsFixed(0).padLeft(15)} |');
  }
  print('=================================================================================');
  print('Total grand (USD): \$${totalGrandUSD.toStringAsFixed(2)}');
  print('Total grand (KHR): KHR ${totalGrandKHR.toStringAsFixed(0)}');
}
