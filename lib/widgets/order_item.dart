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
  double _containerHeight = 0;

  @override
  Widget build(BuildContext context) {
    double _atualHeight = widget.order.products.length * 10.0 + 100;
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '\$${widget.order.amount.toStringAsFixed(2)}',
            ),
            subtitle: Text(
              DateFormat('dd.MM.yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                  if (_containerHeight == 0)
                    _containerHeight = _atualHeight;
                  else
                    _containerHeight = 0;
                });
              },
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            padding: EdgeInsets.all(8.0),
            height: _containerHeight,
            child: ListView.builder(
              itemCount: widget.order.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: Text('${widget.order.products[index].title}')),
                    // Spacer(),
                    Expanded(
                      child: Text(
                        '${widget.order.products[index].price.toStringAsFixed(2)} ',
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                        child: Text(
                            ' x ${widget.order.products[index].quantity}')),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          '${(widget.order.products[index].quantity * widget.order.products[index].price).toStringAsFixed(2)}',
                          textAlign: TextAlign.right,
                          softWrap: false,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
