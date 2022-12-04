# Flutter Get Started

![](./preview.png)

## Flutter

Flutter 의 Dart 는 프로덕션과 개발 환경을 따로 제공.
일반적으로 hot reload 가 작동하는 환경은 빌드된 코드를 실행하는 것보다 속도가 느림.
그래서 Flutter 는 HotReload 가 가능한 개발환경을 따로 제공하고, 프로덕션에서는 컴파일 된 결과물을 사용.
![](https://dart.dev/assets/img/Dart-platforms.svg)

Flutter 프레임워크는 Dart 로 짜여진 코드를 각 플랫폼(ios/android/arm) 의 화면을 구성하는 native 코드로 변환함.

그 과정에서 ios/android 등의 플랫폼에서 제공하는 기본 기능들을 활용하지 않고 모두 직접 화면을 그림.

![](https://docs.flutter.dev/assets/images/docs/arch-overview/archdiagram.png)

예를 들어 ios 의 기본 UI 처럼 보이는 이 팝업은 Flutter 에서 제공하는 Cupertino 위젯인데, 이는 ios 의 테마를 따라서 그려놓은 짭퉁임.

ios 의 기능을 활용해서 띄우는게 아닌, dart 가 os 의 그래픽에 직접 관여해서 비슷하게 만든 UI 를 띄워주는 것.

그래서 Flutter Cupertino 를 통해서 UI 를 그리면 안드로이드 IOS 관계 없이 같은 UI 를 볼 수 있을 것.
(이는 마치 cross platform 을 지원하는 unity 엔진의 방식과도 비슷해보임.)

어플리케이션 전용 unity 같은 느낌도 드는 듯.

![](https://docs.flutter.dev/assets/images/docs/widget-catalog/cupertino-action-sheet.png)

Flutter 와 달리 react native 는 기본적으로 플랫폼이 제공하는 위젯들을 활용하기 때문에, 안드로이드와 IOS 에서 제공되는 UI/UX 가 플랫폼에 따라 상이할 수 있음.

반면에 Flutter 는 완벽하게 동일한 화면을 구성할 수 있음.

## dart 의 const

dart 의 const 는 컴파일 시점에 확정되고 변하지 않음.

컴파일 된 바이너리의 퍼포먼스에 좋은 영향.

Colors.white 와 같이 개발자의 실수를 줄여주고, 가능한 옵션을 쉽게 파악 가능한 Enum 구조를 굉장히 많이 활용.

const 로 설정될 경우 컴파일 시점에 모두 값이 고정되면서 퍼포먼스에는 영향을 주지 않음.

![](https://i.stack.imgur.com/KCZi3.png)

const 를 붙이는 걸 늘 권장하고 매번 밑줄 그어줄 정도.

## 위젯(Widget)

Flutter 의 모든 것은 위젯으로 구성되어있음.

Flutter 의 class 구조는 상당히 개발자 친화적이어서, 위젯을 import 하기만 하면 해당 위젯을 쓰기 위해 필요한 모든 정보를 파악할 수 있음.
