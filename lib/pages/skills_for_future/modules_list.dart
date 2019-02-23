import 'package:edapt/pages/skills_for_future/submodule.dart';
import 'package:flutter/material.dart';

class ModulesList extends StatelessWidget {
  final List modules;

  const ModulesList({Key key, this.modules}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(modules[1]['moduleName']);
    return Scaffold(
      appBar: new AppBar(),
      body: ListView.builder(
        itemCount: modules.length,
        itemBuilder: (context, index) {
          return RaisedButton(
            child: new Text(modules[index]['moduleName']),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubModule(
                          modules: modules,
                         moduleIndex: index, 
                          subModuleIndex: 0,
                        )),
              );
            },
          );
        },
      ),
    );
  }
}
