import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

class BootstrapScreen extends StatelessWidget {
  const BootstrapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(
      gutterSize: 0,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bootstrap Test Screen'),
      ),
      body: Container(
        child: BootstrapRow(
          children: [
            // BootstrapCol(
            //   sizes: 'col-6',
            //   child: Container(
            //     height: 100,
            //     color: Colors.red,
            //   ),
            // ),
            BootstrapCol(
              sizes: 'col-6',
              offsets: 'offset-sm-6',
              child: Container(
                height: 100,
                color: Colors.red,
                child: const Text(
                  'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
