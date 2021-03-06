import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:latihan_40_bloc_listview_builder/bloc/product_bloc.dart';
import 'package:latihan_40_bloc_listview_builder/model/product.dart';
import 'package:latihan_40_bloc_listview_builder/widget/product_card.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Random r = Random();

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    ProductBloc bloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text("ListView Builder Bloc")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              bloc.add(r.nextInt(4) + 2);
            },
            child: Text('Tambah'),
          ),
          BlocBuilder<ProductBloc, List<Product>>(
            builder: (context, products) => Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      (index == 0) ? SizedBox(width: 40) : Container(),
                      ProductCard(
                        imageUrl: products[index].imageUrl,
                        name: products[index].name,
                        price: products[index].price.toString(),
                        onAddCartTap: () {},
                        onIncTap: () {},
                        onDecTap: () {},
                      ),
                      SizedBox(width: 30),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
