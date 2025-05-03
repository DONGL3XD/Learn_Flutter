# addPostFrameCallback

## 에러 유형: on CounterPage()
![image](https://github.com/user-attachments/assets/7b8d7627-02ed-4813-ad2f-ea4838f1aa6b)
 위와 같은 오류는 하나의 Frame 을 그리기 전에 코드가 Widget을 다시 그려달라고 요청한 경우 발생한다.

## 에러 유형: 
![image](https://github.com/user-attachments/assets/818a2077-c474-4685-bc1e-726ceb7775c4)
 위와 같은 오류는 Alert Widget 과 같이 그려진 Widget 에 의존해야 하는 경우 창이 다 그려지지 않았을 때 호출되면 발생한다.


## 해결 방법
 이를 해결하기 위해서는 Frame 이 다 그려진 이후 Widget 을 그려달라고 요청하는 코드를 실행하도록 코드를 수정하면 된다.
 
### 유형 1: WidgetsBinding.instance.addPostFrameCallback((_) { {CODE} });
 Frame이 다 그려진 후에 실행될 Callback 을 설정하는 함수이다.

### 유형 2: Future.delayed(Duration(seconds: 0), (_) { { CODE } });
 화면이 로드된 후 실행되는 Future 의 특성을 활용한 방법이다.

### 유형 3: Future.microtask((_) { { CODE } });
 이 또한 화면이 로드된 후 실행되는 Future 의 특성을 활용한 방법이다.
