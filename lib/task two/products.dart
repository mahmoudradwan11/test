import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_trauxit/task%20two/model.dart';
import 'package:test_trauxit/task%20two/states.dart';

import 'cubit.dart';
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnlineCubit, OnlineStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OnlineCubit.get(context);
          return Scaffold(
            body:SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Exclusive Offer',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        MaterialButton(
                          onPressed: () {},
                          child: const Text(
                            'see All',
                            style: TextStyle(color: Colors.green),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 250,
                      child: ListView.separated(
                        //physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => buildProductItem(exclusive[index],context),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                        itemCount: exclusive.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                      ]
                      ),
                      ),
                      ),
    );
    }
    );
  }
}
