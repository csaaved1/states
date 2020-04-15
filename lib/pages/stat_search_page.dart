import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/bloc.dart';
import 'package:states/data/model/stat.dart';

class StatSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Member Search"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocListener<StatBloc, StatState>(
          listener: (context, state) {
            if (state is StatError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<StatBloc, StatState>(
            builder: (context, state) {
              if (state is StatInitial) {
                return buildInitialInput();
              } else if (state is StatLoading) {
                return buildLoading();
              } else if (state is StatLoaded) {
                return buildColumnWithData(context, state.stat);
              } else if (state is StatError) {
                return buildInitialInput();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: MemberInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

//   Column buildColumnWithData(BuildContext context, Stat stat) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Text(
//           stat.memberName,
//           style: TextStyle(
//             fontSize: 40,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         Text(
//           // Display the temperature with 1 decimal place
//           "${stat.frontEndStrength.toStringAsFixed(1)}",
//           style: TextStyle(fontSize: 80),
//         ),
//         RaisedButton(
//           child: Text('See Details'),
//           color: Colors.lightBlue[100],
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (_) => BlocProvider.value(
//                   value: BlocProvider.of<StatBloc>(context),
//                   child: StatDetailPage(
//                     masterStat: stat,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         MemberInputField(),
//       ],
//     );
//   }
// }


  Column buildColumnWithData(BuildContext context, Stat stat) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          stat.memberName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
         Text(
          // Display the temperature with 1 decimal place
          "Member Speciality:${stat.memberSpecialty}",
          style: TextStyle(fontSize: 30),
        ),
        MemberInputField(),
      ],
    );
  }
}

class MemberInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitMemberName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitMemberName(BuildContext context, String memberName) {
    final memberBloc = BlocProvider.of<StatBloc>(context);
    memberBloc.add(GetStat(memberName));
  }
}