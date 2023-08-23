import 'package:flutter/material.dart';

import 'cubit.dart';

class Products
{
  String? image;
  String? name;
  String? description;
  String? price;
  String? size;
  Products(this.image,this.name,this.description,this.price,this.size);
}
List<Products> exclusive = [
  Products(
      'images/bannana.png',
      'Organic Bananas',
      'Bananas are nutritious. Bananas may be good for weight loss. bananas may be good for your heart. As part of a healtful and varied diet.',
      '\$5.21',
      '1Kg'),
  Products(
      'images/red parrer.png',
      'Bell Pepper Red',
      'Parrer are nutritious. Parrer may be good for weight loss. Perrer may be good for your heart. As part of a healtful and varied diet.',
      '\$4.99',
      '1kg'),
  Products(
      'images/pngfuel.png',
      'Ginger',
      'Ginger are nutritious. Ginger may be good for weight loss. Ginger may be good for your heart. As part of a healtful and varied diet.',
      '\$3.12',
      '1kg'),
  Products(
      'images/coke zero.png',
      'Diet Coke',
      'Diet Coke are nutritious. Diet Coke may be good for weight loss. Diet Coke may be good for your heart. As part of a healtful and varied diet.',
      '\$1.99',
      '330ml'),
];
Widget buildProductItem(model, context) => InkWell(
  onTap: () {
    },
  child: Container(
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(20),
    ),
    width: 180,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
              alignment: AlignmentDirectional.center,
              child: Image(
                image: AssetImage(model.image!),
                height: 84,
              )),
          const SizedBox(
            height: 20,
          ),
          Text(
            model.name!,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(model.size!),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  model.price!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    OnlineCubit.get(context).insertCart(
                        name: model.name,
                        size: model.size,
                        price: model.price,
                        image: model.image);
                  //  showToast('Insert', ToastStates.SUCCESS);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    height: 45,
                    width: 40,
                    child: const Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  ),
);

