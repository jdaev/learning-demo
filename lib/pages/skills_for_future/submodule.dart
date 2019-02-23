import 'package:edapt/pages/skills_for_future/objective_question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutube/flutube.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SubModule extends StatefulWidget {
  final List modules;
  final int moduleIndex;
  final int subModuleIndex;
  const SubModule(
      {Key key, this.modules, this.subModuleIndex, this.moduleIndex})
      : super(key: key);
  _SubModuleState createState() => _SubModuleState();
}

class _SubModuleState extends State<SubModule>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List subModule = widget.modules[widget.moduleIndex]['subModules'];
    var objectiveQ = widget.modules[widget.moduleIndex]['objectiveQuestions'];
    var descriptiveQ =
        widget.modules[widget.moduleIndex]['descriptiveQuestion'];
    var truthQ = widget.modules[widget.moduleIndex]['trueOrFalseQuestions'];
    var moduleName = widget.modules[widget.moduleIndex]['moduleName'];
    var textContent = subModule[widget.subModuleIndex]['content'];
    var videoTranscript = subModule[widget.subModuleIndex]['videoTranscript'];
    var markdownContent = textContent;

    if (videoTranscript == null){
      videoTranscript = "";
    }

    return Scaffold(
        appBar: new AppBar(
          title: Text(subModule[widget.subModuleIndex]['subModuleTitle']),
        ),
        bottomNavigationBar: new BottomAppBar(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  print(subModule.length);
                  print(widget.subModuleIndex);
                  setState(() {
                    if (_endOfModule(subModule.length, widget.subModuleIndex)) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ObjectiveQuestion(
                                  questions: objectiveQ,
                                  descriptiveQ: descriptiveQ,
                                  truthQ: truthQ,
                                ),
                          ));
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubModule(
                                  modules: widget.modules,
                                  subModuleIndex: _returnSubModuleIndex(
                                      subModule.length, widget.subModuleIndex),
                                  moduleIndex: _returnModuleIndex(
                                      widget.modules.length,
                                      widget.moduleIndex,
                                      widget.subModuleIndex,
                                      subModule.length),
                                )),
                      );
                    }
                  });
                },
                child: _endOfModule(subModule.length, widget.subModuleIndex) ==
                        true
                    ? Text('ANSWER QUESTIONS TO PROCEED')
                    : Text('NEXT'),
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: subModule[widget.subModuleIndex]['vIdeoLink'].isNotEmpty
                    ? Column(
                        //mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            child: FluTube(
                              subModule[widget.subModuleIndex]['vIdeoLink'],
                              autoInitialize: true,
                              aspectRatio: 16 / 9,
                              showThumb: true,
                              onVideoStart: () {},
                              onVideoEnd: () {},
                            ),
                          ),
                          videoTranscript.length > 0
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor),
                                  child: TabBar(
                                    controller: _tabController,
                                    tabs: [
                                      Tab(
                                        text: 'Description',
                                      ),
                                      Tab(
                                        text: 'Transcript',
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                          videoTranscript.length > 0
                              ? Flexible(
                                  fit: FlexFit.loose,
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: <Widget>[
                                      Markdown(
                                        data: textContent,
                                      ),
                                      Markdown(
                                        data: videoTranscript,
                                      )
                                    ],
                                  ),
                                )
                              : Flexible(
                                fit: FlexFit.loose,
                                  child: Markdown(
                                    data: textContent,
                                    padding: EdgeInsets.all(16.0),
                                  ),
                                )
                        ],
                      )
                    : Container(
                        child: Markdown(
                          data: textContent,
                          padding: EdgeInsets.all(16.0),
                        ),
                      )),
          ],
        ));
  }

  int _returnSubModuleIndex(length, currentIndex) {
    if ((currentIndex + 1) < length)
      return currentIndex + 1;
    else
      return 0;
  }

  int _returnModuleIndex(length, currentIndex, currentSubIndex, subLength) {
    if ((currentSubIndex + 1) >= subLength) {
      if ((currentIndex + 1) < length)
        return currentIndex + 1;
      else
        return currentIndex;
    } else
      return currentIndex;
  }

  bool _endOfModule(length, currentIndex) {
    if ((currentIndex + 1) < length)
      return false;
    else
      return true;
  }
}
