import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../provider/orders.dart' as oi;

class OrderItem extends StatefulWidget {
  final oi.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '\$${widget.order.amount}',
            ),
            subtitle: Text(
              DateFormat('dd.MM.yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
            ),
          ),
          if (expanded)
            Container(
              padding: EdgeInsets.all(8.0),
              height: min(widget.order.products.length * 10.0 + 100, 180),
              child: ListView.builder(
                itemCount: widget.order.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('${widget.order.products[index].title}'),
                      Spacer(),
                      Text('${widget.order.products[index].price} '),
                      Text(' x ${widget.order.products[index].quantity}'),
                      Container(
                          padding: EdgeInsets.all(5.0),
                          width: 70,
                          child: Text(
                            '${(widget.order.products[index].quantity * widget.order.products[index].price).toStringAsFixed(2)}',
                            textAlign: TextAlign.right,
                          )),
                    ],
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
