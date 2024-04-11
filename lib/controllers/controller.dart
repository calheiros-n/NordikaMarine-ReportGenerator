import 'package:get/get.dart';

class ButtonVisibilityController extends GetxController {
  var extra1Visible = false.obs;
  var extra2Visible = false.obs;
  var extra3Visible = false.obs;
  var extra4Visible = false.obs;
  var extra5Visible = false.obs;
  var extra6Visible = false.obs;
  var extra7Visible = false.obs;
  var extra8Visible = false.obs;
  var extra9Visible = false.obs;
  var extraButtonVisible = true.obs;
  var buttonClickedCount = 0.obs;

  void incrementButtonClickedCount() {
    if (extra1Visible.value) {
      extra1Visible.value = false;
      extra2Visible.value = true;
    } else if (extra2Visible.value) {
      extra2Visible.value = false;
      extra3Visible.value = true;
    } else if (extra3Visible.value) {
      extra3Visible.value = false;
      extra4Visible.value = true;
    } else if (extra4Visible.value) {
      extra4Visible.value = false;
      extra5Visible.value = true;
    } else if (extra5Visible.value) {
      extra5Visible.value = false;
      extra6Visible.value = true;
    } else if (extra6Visible.value) {
      extra6Visible.value = false;
      extra7Visible.value = true;
    } else if (extra7Visible.value) {
      extra7Visible.value = false;
      extra8Visible.value = true;
    } else if (extra8Visible.value) {
      extra8Visible.value = false;
      extra9Visible.value = true;
    } else if (extra9Visible.value) {
      extra9Visible.value = false;
      extraButtonVisible.value = false;
    }
    printButtonVisibility();
  }

  // Verifica se todos os botões extras estão visíveis
  bool allButtonsVisible() {
    return extra2Visible.value &&
        extra3Visible.value &&
        extra4Visible.value &&
        extra5Visible.value &&
        extra6Visible.value &&
        extra7Visible.value &&
        extra8Visible.value &&
        extra9Visible.value;
  }

  // Atualiza a visibilidade do próximo botão extra
  void updateNextButtonVisibility() {
    if (!extra2Visible.value) {
      extra2Visible.value = true;
    } else if (!extra3Visible.value) {
      extra3Visible.value = true;
    } else if (!extra4Visible.value) {
      extra4Visible.value = true;
    } else if (!extra5Visible.value) {
      extra5Visible.value = true;
    } else if (!extra6Visible.value) {
      extra6Visible.value = true;
    } else if (!extra7Visible.value) {
      extra7Visible.value = true;
    } else if (!extra8Visible.value) {
      extra8Visible.value = true;
    } 
    printButtonVisibility();
  }

  void incrementButtonClickedCount2() {
    buttonClickedCount++;
    if (buttonClickedCount.value == 1) {
      extra1Visible.value = true;
    } else if (buttonClickedCount.value >= 2 && buttonClickedCount.value <= 9) {
      // Verifica se todos os botões extras já estão visíveis
      if (buttonClickedCount.value == 9) {
        extra9Visible.value = true;
        extraButtonVisible.value = false;
      } else {
        updateNextButtonVisibility();
      }
    }
    printButtonVisibility();
  }

  // Função para imprimir o estado atual das visibilidades dos botões
  void printButtonVisibility() {
    print('Extra1Visible: ${extra1Visible.value}');
    print('Extra2Visible: ${extra2Visible.value}');
    print('Extra3Visible: ${extra3Visible.value}');
    print('Extra4Visible: ${extra4Visible.value}');
    print('Extra5Visible: ${extra5Visible.value}');
    print('Extra6Visible: ${extra6Visible.value}');
    print('Extra7Visible: ${extra7Visible.value}');
    print('Extra8Visible: ${extra8Visible.value}');
    print('Extra9Visible: ${extra9Visible.value}');
    print('ExtraButtonVisible: ${extraButtonVisible.value}');
    print('ButtonClickedCount: ${buttonClickedCount.value}');
  }
}
