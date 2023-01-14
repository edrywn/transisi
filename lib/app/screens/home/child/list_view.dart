// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transisi/app/bloc/employe/get_employes/employes_bloc.dart';
import 'package:transisi/app/screens/home/detail_page.dart';

import '../../../utilities/theme.dart';

class ListEmploye extends StatefulWidget {
  final EmployeLoaded state;
  const ListEmploye({Key? key, required this.state}) : super(key: key);

  @override
  State<ListEmploye> createState() => _ListEmployeState();
}

class _ListEmployeState extends State<ListEmploye> {
  int _page = 1;
  @override
  Widget build(BuildContext context) {
    final employeBloc = BlocProvider.of<EmployeBloc>(context);
    _onScroll() {
      _page = _page + 1;
      employeBloc.add(GetScrollEmployeEventList(_page));
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: defaultPadding,
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification &&
                notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent) {
              if (!widget.state.hasReachedMax) {
                _onScroll();
              }

              return false;
            } else {
              return false;
            }
          },
          child: ListView.separated(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemBuilder: ((context, index) {
                if (index >= widget.state.itemEmploye.length) {
                  return !widget.state.hasReachedMax
                      ? Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.keyboard_arrow_up_rounded),
                              Text("Load More"),
                            ],
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(10),
                          child: const Center(
                            child: Text("Last"),
                          ),
                        );
                  ;
                }

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            id: widget.state.itemEmploye[index].id.toString(),
                          ),
                        ));
                  },
                  child: ListTile(
                    leading: ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(25), // Image radius
                        child: Image.network(
                            widget.state.itemEmploye[index].avatar!,
                            fit: BoxFit.cover),
                      ),
                    ),
                    title: Text(
                        "${widget.state.itemEmploye[index].first_name!} ${widget.state.itemEmploye[index].last_name!}"),
                    subtitle: Text(widget.state.itemEmploye[index].email!),
                    trailing: const Icon(
                      Icons.star_border,
                      color: primaryColor,
                    ),
                  ),
                );
              }),
              separatorBuilder: ((context, index) {
                return const Divider(
                  thickness: 1,
                );
              }),
              itemCount: widget.state.itemEmploye.length + 1),
        ),
      ),
    );
  }
}
