import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:testdeqode/States/home_screen_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenState>(
      builder: (context, state, child) {
        return state.fetching
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.data.search.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Card(
                        elevation: 18.0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Image.network(
                          state.data.search[index].poster,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.all(8.0),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.all(8.0),
                          child: Text(
                            state.data.search[index].title,
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
      },
    );
  }
}
