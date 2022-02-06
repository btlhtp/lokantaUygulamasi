import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/model/cart_provider.dart';
import 'package:restaurantapp/model/item.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {

    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          bottomNavigationBar: Container(
            width: Get.width,
            height: Get.height/6,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.5,

                  // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(30)),
              color: Colors.white,
            ),
            child: Column(
              children: [

                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sipariş tutarı:",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                      "\$ ${cart.totalPrice}",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(50 / 2)),
                    child: Center(
                      child: Text(
                        "Ödeme Yap",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

              ],
            ),


          ),
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              shadowColor: Colors.grey.shade200,
              title: Text('Shopping Card ',style: TextStyle(color:Colors.black),),
            ),
            body: cart.basketItems.length == 0
                ? Text('no items in your cart')
                : ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: cart.basketItems.length,
        itemBuilder: (context,index){
        return Container(
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width/3,
        height: MediaQuery.of(context).size.height/5,
        color: Colors.transparent,
        child: Row(
        children: [
        Expanded(flex:2,child: Container( margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
        image: AssetImage(cart.basketItems[index].image.toString()),
        fit: BoxFit.fill)),),),
        Expanded(flex:3,child: Container(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(height: 13,),
        Expanded(flex:1,child: Container(  margin:EdgeInsets.only(left:5,),child:Text(
        cart.basketItems[index].title.toString(),
        style: TextStyle(fontSize: 22,   fontFamily: 'Varela',),
        ),),),
       Expanded(child:  IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
        cart.remove(cart.basketItems[index]);
        },
        ),)


        ],
        ),)),
        ],
        ),
        );
        }
      )
        );
           /* ListView.builder(
              itemCount: cart.basketItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(cart.basketItems[index].title.toString()),
                    subtitle:
                    Text(cart.basketItems[index].price.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        cart.remove(cart.basketItems[index]);
                      },
                    ),
                  ),
                );
              },
            ));*/
      },
    );
  }
}
