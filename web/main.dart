import 'dart:html';

var totalOrderAmount = 0;
var totalClicks = 0;
var cartItems = []; 
var productNames = ['Chiken Biryani', 'Chiken Haleem']; 

void main() {
  var addToCartButtons = querySelectorAll('.add');
  var addToCartButtons2 = querySelectorAll('.add2');
  var placeOrderLink = querySelector('.place-order');

  addToCartButtons.forEach((button) {
    button.onClick.listen((event) {
      event.preventDefault();
      handleAddToCart(button);
    });
  });

  addToCartButtons2.forEach((button) {
    button.onClick.listen((event) {
      event.preventDefault();
      handleAddToCart(button);
    });
  });

  placeOrderLink!.onClick.listen((event) {
    event.preventDefault();
    placeOrder();
  });
}

var h2 = querySelectorAll('.product-price');

void handleAddToCart(Element button) {
  var productIndex = int.parse(button.dataset['index']!);
  var totalPriceSpan = querySelector('.total-price');

  if (totalPriceSpan != null && h2.isNotEmpty) {
    var productPrice = int.parse(h2[productIndex].text!.split(':')[1].trim());

    totalPriceSpan.text = 'Rs: $productPrice';
    totalOrderAmount += productPrice;
    cartItems.add({
      'productIndex': productIndex,
      'productPrice': productPrice,
    });
  }

  totalClicks++;
  updateTotalItems(totalClicks);
  updateOrderAmount();
}

void updateTotalItems(int totalClicks) {
  var totalItemsSpan = querySelector('.total-items');

  if (totalItemsSpan != null) {
    totalItemsSpan.text = 'Items: $totalClicks';
  }
}

void updateOrderAmount() {
  var totalAmountSpan = querySelector('.total-amount');

  if (totalAmountSpan != null) {
    totalAmountSpan.text = 'Total Amount: Rs $totalOrderAmount';
  }
}

void placeOrder() {
  var orderDetails = '';
  
  for (var item in cartItems) {
    var productName = productNames[item['productIndex']];
    orderDetails += '$productName: Rs ${item['productPrice']}\n';
  }

 
  window.alert('Order Details:\n\n$orderDetails\nTotal Amount: Rs $totalOrderAmount');
  
 
  cartItems = [];
  totalOrderAmount = 0;
  totalClicks = 0;
  updateTotalItems(totalClicks);
  updateOrderAmount();
}
