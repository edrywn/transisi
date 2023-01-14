import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:transisi/app/bloc/employe/get_employe/employe_bloc.dart';
import 'package:transisi/app/utilities/theme.dart';

class DetailPage extends StatefulWidget {
  String? id;
  DetailPage({super.key, this.id});
  static const routeName = 'detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final employe = BlocProvider.of<EmpBloc>(context);
    employe.add(GetEmp(widget.id));

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: BlocBuilder<EmpBloc, EmpState>(
        builder: (context, state) {
          if (state is EmpInitial) {
            return Center(
                child: SizedBox(
              child: Lottie.asset("lottie/loading.zip", width: 250),
            ));
          } else if (state is EmpLoading) {
            return Center(
                child: SizedBox(
              child: Lottie.asset("lottie/loading.zip", width: 250),
            ));
          } else if (state is EmpLoaded) {
            return Column(
              children: [
                Container(
                    height: height / 3,
                    width: width,
                    color: primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(width / 7), // Image radius
                            child: Image.network(
                                state.itemModel!.avatar.toString(),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${state.itemModel!.first_name.toString()} ${state.itemModel!.last_name.toString()}",
                          style: TextStyle(
                            fontSize: 20,
                            color: whiteColor,
                          ),
                        )
                      ],
                    )),
                Expanded(
                  child: Padding(
                    padding: defaultPadding,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(5),
                          child: ListTile(
                            leading: Icon(
                              Icons.email,
                              size: 30,
                              color: primaryColor,
                            ),
                            title: Text(state.itemModel!.email.toString()),
                            subtitle: Text("E-Mail"),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.chat),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
                child: SizedBox(
              child: CircularProgressIndicator(),
            ));
          }
        },
      ),
    );
  }
}
