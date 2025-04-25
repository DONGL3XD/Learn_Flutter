# Provider access
## Ananymous Route Access
- Anonymous Route란
   이름이 없는 Route. 보통의 Navigator 를 통해 관리되는 Route 이다.

- Anonymous Route 에서 Provider Access 가 불가능할 때
   이 경우 Flutter 의 Widget Tree 를 보면 Route 된 페이지가 ChangeNotifierProvider Widget 의 상위 위젯의 자식으로 있는 것을 볼 수 있을 것이다. 이 경우 ChangeNotifierProvider 생성자를 다시 사용한다면 같은 기능의 Provider 를 중복으로 만들게 됨으로 이미 존재하는 값을 전달하는 기능을 가진 .value 를 사용하는 것이 권장된다.
 Route 위젯이 ChangeNotifierProvider.value 위젯을 return 하도록 설계하고 value 속성값으로 넘기고자 하는 값, 우리의 경우 Provider 의 값 (ex: context.read<Counter>()) 을 넘겨주면 된다. 이때 BuildContext 가 Provider 가 정의된 Widget 의 BuildContext 인지 확인해야 한다.
