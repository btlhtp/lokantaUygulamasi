import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/model/cart_provider.dart';
import 'package:restaurantapp/model/item.dart';
import 'package:restaurantapp/routes/app_routes.dart';



class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Item> items = [
    Item(image:"assets/images/ormankebabi.jpeg",title: 'Orman Kebabı ', price: 50.0),
    Item(image:"assets/images/tavukcorba.jpeg",title: 'Tavuk Çorba', price: 40.0),
    Item(image:"assets/images/tavuksote.jpeg",title: 'Tavuk Sote', price: 40.0),
  ];

  @override
  Widget build(BuildContext context) {
     return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        backgroundColor: Color(0xfff8f6f6),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.grey.shade200,
          title: Text("Product List",style:TextStyle(color:Colors.black)),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: (){Get.toNamed(AppRoutes.SHOPPINGPAGE);},
                child:Center(
                  child: Badge(
                      badgeContent:Consumer<Cart>(
                        builder: (context,value,child){
                          return  Text(cart.count.toString(),style: TextStyle(color:Colors.white));
                        },
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      child:Icon(Icons.shopping_cart,color: Colors.black,)
                  ),
                ),
              ),
            )
          ],
        ),
        body:ListView(
          children: [
            SizedBox(height: 15.0,),
            Container(
              padding: EdgeInsets.only(right: 15.0,left: 15.0),
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height,
              child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.8,),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3.0,
                                blurRadius: 5.0)
                          ],
                        ),
                        child:Stack(
                          children: [
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Expanded(flex:1,child:Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              icon:Icon(Icons.add),
                                              onPressed: () {
                                                cart.add(items[index]);
                                              },
                                            )
                                          ])),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child:  Container(
                                      margin: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(items[index].image.toString()),
                                            fit: BoxFit.fill),
                                      ),
                                    ),

                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child:   Text('\$${items[index].price}',
                                          style: TextStyle(
                                              color: Color(0xFFCC8053),
                                              fontFamily: 'Varela',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child:Text(items[index].title.toString(),
                                          style: TextStyle(
                                              color: Color(0xFF575E67),
                                              fontFamily: 'Varela',
                                              fontSize: 14.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    );
                  }),
            ),
            SizedBox(height: 15.0)
          ],
        ),
      );
    });
    /*Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: (){Get.toNamed(AppRoutes.SHOPPINGPAGE);},
              child:Center(
                child: Badge(

                    badgeContent:Consumer<CartProvider>(
                      builder: (context,value,child){
                        return  Text(value.getCounter().toString(),style: TextStyle(color:Colors.white));
                      },
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    child:Icon(Icons.shopping_cart)
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child:ListView.builder(
            itemCount: ProductData.getProducts().length,
              itemBuilder: (context,index){
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image(
                        height: 100,
                        width: 100,
                        image: AssetImage("assets/images/ormankebabi.jpeg"),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                          child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productListController.products[index].productName.toString(),
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          SizedBox(height: 5,),
                          Text(productListController.products[index].productPrice.toString(),
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                          , SizedBox(height: 5,),
                          Align(
                            alignment: Alignment.centerRight,
                            child:InkWell(
                              onTap: (){
                                cart.addTotalPrice(double.parse(productListController.products[index].productPrice.toString()));
                                cart.addCounter();
                              },
                              child:  Container(
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(
                                    child:Text("Add to cart",style: TextStyle(color: Colors.white),)
                                ),
                              ),
                            )

                          )

                        ],
                      ))
                    ],
                  )
                ],
              ),

            );
           }))
        ],
      ),
    );*/
  }

}
