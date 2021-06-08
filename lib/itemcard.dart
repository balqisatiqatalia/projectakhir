import 'package:flutter/material.dart';
import 'package:projectakhir/editbio.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String tgllahir;
  final String alamat;
  final String id;
  //// Pointer to Update Function
  //final Function onUpdate;
  //// Pointer to Delete Function
  final Function onDelete;

  ItemCard(this.name, this.tgllahir, this.alamat, this.id, {this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.lightBlue)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(name,
                        style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                        ),
              ),
              Text(
                tgllahir,
                style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
              ),
              Text(
                alamat,
                style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: RaisedButton(
                    shape: CircleBorder(),
                    color: Colors.red[900],
                    child: Center(
                        child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      // if (onDelete != null) onDelete!();
                      onDelete();
                    }),
              )
            ],
          ),
          //  Row(
          //   children: [
          //     SizedBox(
          //       height: 40,
          //       width: 60,
          //       child: RaisedButton(
          //           shape: CircleBorder(),
          //           color: Colors.red[900],
          //           child: Center(
          //               child: Icon(
          //             Icons.edit,
          //             color: Colors.white,
          //           )),
          //           onPressed: () {
          //                  Navigator.of(context).push(
          //                   MaterialPageRoute(
          //                     builder: (context) {
          //                       return Editbio(name, tgllahir, alamat, id);
          //         },
          //       ),
          //     );

                          //},
              //      onPressed: () => Navigator.push( context,
              //   MaterialPageRoute(
              //     builder: (context) =>Editbio(name, tgllahir, alamat, id),                
              //   ),
              // ),
          //     ),
          //     )
          //   ],
          // ),
          // InkWell(
          //                 onTap: () {
          //                  Navigator.of(context).push(
          //                   MaterialPageRoute(
          //                     builder: (context) {
          //                       return Editbio(name, tgllahir, alamat, id);
          //         },
          //       ),
          //     );

          //                 },

          // ),],
      //),
      
    ],
      )
    );
  }
}