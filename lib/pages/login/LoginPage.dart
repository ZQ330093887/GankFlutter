import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:GankFlutter/common/GlobalConfig.dart';
import 'package:GankFlutter/common/CommonShare.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<ScaffoldState> registKey = new GlobalKey();

  String _phoneNum = '';

  String _verifyCode = '';

  Widget _buildPhoneEdit() {
    var node = new FocusNode();
    return new Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
      child: new TextField(
        onChanged: (str) {
          _phoneNum = str;
          setState(() {});
        },
        decoration: new InputDecoration(
            hintText: GlobalConfig.inputNice,
            labelText: GlobalConfig.nice,
            hintStyle: new TextStyle(fontSize: 12.0, color: Colors.grey)),
        maxLines: 1,
        maxLength: 11,
        //键盘展示为号码
        keyboardType: TextInputType.phone,
        //只能输入数字
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly,
        ],
        onSubmitted: (text) {
          FocusScope.of(context).reparentIfNeeded(node);
        },
      ),
    );
  }

  Widget _buildVerifyCodeEdit() {
    var node = new FocusNode();
    Widget verifyCodeEdit = new TextField(
      onChanged: (str) {
        _verifyCode = str;
        setState(() {});
      },
      decoration: new InputDecoration(
          hintText: GlobalConfig.inputCode,
          labelText: GlobalConfig.pwd,
          hintStyle: new TextStyle(fontSize: 12.0, color: Colors.grey)),
      maxLines: 1,
      maxLength: 6,
      //键盘展示为数字
      keyboardType: TextInputType.number,
      //只能输入数字
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
      ],
      onSubmitted: (text) {
        FocusScope.of(context).reparentIfNeeded(node);
      },
    );

    return new Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0),
      child: new Stack(
        children: <Widget>[
          verifyCodeEdit,
        ],
      ),
    );
  }

  Widget _buildRegister() {
    return new Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
      child: new RaisedButton(
        padding: new EdgeInsets.fromLTRB(130.0, 10.0, 130.0, 10.0),
        color: GlobalConfig.colorPrimary,
        textColor: Colors.white,
        disabledColor: Colors.blue[100],
        onPressed: (_phoneNum.isEmpty || _verifyCode.isEmpty)
            ? null
            : () {
                showTips();
              },
        child: new Text(
          GlobalConfig.loginSubView,
          style: new TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTips() {
    return new Padding(
      padding: const EdgeInsets.only(
          left: 40.0, right: 40.0, top: 50.0, bottom: 50.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center, //子组件的排列方式为主轴两端对齐
        children: <Widget>[
          new Image.asset(
            'images/logo.png',
            width: 60.0,
            height: 60.0,
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return new Column(
      children: <Widget>[
        _buildTips(),
        _buildPhoneEdit(),
        _buildVerifyCodeEdit(),
        _buildRegister(),
      ],
    );
  }

  showTips() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
              child: new Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: new Text('没有相关接口，这是一个纯UI界面，提供部分交互体验',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 24.0))));
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Scaffold(
        key: registKey,
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text(GlobalConfig.githubLogin),
          actions: <Widget>[
            new InkWell(
              child: new Padding(
                padding: EdgeInsets.all(18.0),
                child: new Text(GlobalConfig.pwdLogin),
              ),
              onTap: () {
//                showTips();
                CommonShare.buildShareBottomPop(context);
              },
            )
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}
