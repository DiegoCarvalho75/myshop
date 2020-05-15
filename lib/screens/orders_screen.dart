// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../provider/orders.dart' show Orders;
// import '../widgets/order_item.dart';
// import '../widgets/app_drawer.dart';

// class OrdersScreen extends StatefulWidget {
//   static const routeName = '/orders';

//   @override
//   _OrdersScreenState createState() => _OrdersScreenState();
// }

// class _OrdersScreenState extends State<OrdersScreen> {
//   var _isLoading = false;

//   @override
//   void initState() {
//     Future.delayed(Duration.zero).then((_) async {
//       setState(() {
//         _isLoading = true;
//       });
//       await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
//       setState(() {
//         _isLoading = false;
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final orderData = Provider.of<Orders>(context);
//     print(orderData.orders.length);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Orders'),
//       ),
//       drawer: AppDrawer(),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: orderData.orders.length,
//               itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/orders.dart' show Orders;
import '../widgets/order_item.dart' as oi;
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key key}) : super(key: key);
  static const routeName = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  ///////////////////////////////////////////////
  /////////  Another Aprouch for fetching data
  ///////////////////////////////////////////////

  // @override
  // void initState() {
  //   try {
  //     Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  //   } catch (e) {
  //     print(e);
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    // print(orderData.orders);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
      ),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<Orders>(
              builder: (ctx, orderData, child) => ListView.builder(
                itemCount: orderData.orders.length,
                itemBuilder: (ctx, i) => oi.OrderItem(orderData.orders[i]),
              ),
            );
          }
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
