import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_trauxit/task%20two/states.dart';

import 'cubit.dart';

class Cart extends StatelessWidget {
const Cart({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return BlocConsumer<OnlineCubit, OnlineStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OnlineCubit.get(context);
        var cart = cubit.cart;
        var scaffoldKey = GlobalKey<ScaffoldState>();
        if (cart.isEmpty) {
          return Scaffold(
            backgroundColor: Colors.white,
            key: scaffoldKey,
            appBar: AppBar(
              title: const Text(
                'My Cart',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body:const Center(
              child: Image(image: AssetImage('images/image 13.png'),),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            key: scaffoldKey,
            appBar: AppBar(
              title: const Text(
                'My Cart',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Container(
                  color: Colors.grey[200],
                  height: 1,
                  width: double.infinity,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          buildCartItem(cart[index], context),
                      separatorBuilder: (context, index) => Container(height: 1,width: 1,),
                      itemCount: cart.length),
                ),
              ],
            ),
          );
        }
      });
}

Widget buildCartItem(Map model, context) => Container(
  color: Colors.white,
  height: 170,
  child: Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Row(
      children: [
        Image(
          image: AssetImage(model['image']),
          height: 83,
          width: 90,
        ),
        const SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 210,
                    child: Row(
                      children: [
                        Text(
                          model['name'],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'Jannah'),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        OnlineCubit.get(context)
                            .deleteCartData(id: model['id']);
                     //   showToast('Deleted Successfully', ToastStates.SUCCESS);
                      },
                      child: const Icon(
                        Icons.cancel,
                        color: Colors.grey,
                      ))
                ],
              ),
              Text(
                model['size'],
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: 'Jannah'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                           // OnlineCubit.get(context).minusCounter();
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.grey,
                          )),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                        //    OnlineCubit.get(context).addCounter();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.green,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Text(
                    model['price'],
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Jannah'),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  ),
);
}
