// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat numberFormat = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset(product.assetName,package: product
                  .assetPackage,fit: BoxFit.fitWidth,),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product.name,style: theme.textTheme.title,
                    maxLines: 1,),
                    SizedBox(height: 8.0),
                    Text(numberFormat.format(product.price),style: theme
                        .textTheme.body2,),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }).toList();
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
        title: new Text('SHRINE'),
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
            onPressed: () {
              print('Menu button');
            }),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () {
                print('Search button');
              }),
          new IconButton(
              icon: Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ),
              onPressed: () {
                print('Filter button');
              }),
          new IconButton(
              icon: Icon(
                Icons.more_vert,
                semanticLabel: 'more',
              ),
              onPressed: () {
                print('More button');
              })
        ],
      ),
      // TODO: Add a grid view (102)
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
      // TODO: Set resizeToAvoidBottomInset (101)
      resizeToAvoidBottomInset: false,
    );
  }
}
