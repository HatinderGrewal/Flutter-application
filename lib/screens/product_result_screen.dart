import 'package:flutter/material.dart';
import 'package:flutter_firebase/api_client.dart';
import 'package:flutter_firebase/models/product_model.dart';

class ProductResultScreen extends StatefulWidget {
  const ProductResultScreen({Key? key}) : super(key: key);

  @override
  State<ProductResultScreen> createState() => _ProductResultScreenState();
}

class _ProductResultScreenState extends State<ProductResultScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text('Product Result Screen',style: TextStyle(color: Colors.black),),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: ApiClient().getAllProduct(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context ,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text('Product ID : ${snapshot.data![index].id}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Image.network(snapshot.data![index].imgUrl,height: 100,width: 100,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('Price : ${snapshot.data![index].price} \$'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text('Description : ${snapshot.data![index].description}'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }else {
            return const Center(child: CircularProgressIndicator(color: Colors.blue,));
          }
        },
      ),
    );
  }

}
