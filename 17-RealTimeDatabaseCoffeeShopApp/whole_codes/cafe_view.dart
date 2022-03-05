import 'package:firebaserealtime/cafe_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CafeView extends StatelessWidget {
  const CafeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Provider Example'),

              Consumer<CafeModel>(builder: (context, model, child){
                if(model.dailySpecial != null){
                  return Text(model.dailySpecial!.fancyDescription());
                }else{
                  return CircularProgressIndicator();
                }
              },),

              ElevatedButton(
                  onPressed:() => Provider.of<CafeModel>(context,listen: false)
                    .repriceDailySpecial(),
                  child: Text('Randomize price')),

              SizedBox(height: 15,),

              Text('ORDERS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              ),

              Consumer<CafeModel>(
                builder:(context,model,child){
                  return Expanded(
                      child: ListView(
                        children: [
                          ...model.orders.map((order) => Card(
                            child : ListTile(
                              leading : Icon(Icons.local_cafe_outlined),
                              title: Text(order.description),
                              subtitle : Text(
                                '${order.costumerName} \$${order.price}'),
                            ),
                          ),),
                        ],
                      ),
                    );
                  },
                )
            ],
        ),
    ),
    ),);
  }
}
