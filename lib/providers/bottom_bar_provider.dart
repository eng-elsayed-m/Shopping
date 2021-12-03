import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarProvider extends ChangeNotifier {
  static BottomBarProvider of(BuildContext context, {bool listen = true}) =>
      Provider.of<BottomBarProvider>(context, listen: listen);

  int _selectedIndex = 0;
  int _selectedIndexManagement = 1;
  bool _selection = false;

  int getIndex() => _selectedIndex;

  int getIndexmanagement() => _selectedIndexManagement;

  bool getSelection() => _selection;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setIndexManagement(int indexManagement) {
    _selectedIndexManagement = indexManagement;
    notifyListeners();
  }

  void setSelection(bool selection) {
    _selection = selection;
    notifyListeners();
  }
}
