# swift-drawingapp
세번째 프로젝트 - 드로잉 앱

# 기능 요구 사항
## 1. 아이패드 앱 프로젝트
- [x] General에서 Devices 항목을 iPad로 변경
- [x] Device Orientation 설정
- [x] 시뮬레이터는 4세대로
- [x] MVC 구조
- [x] 리드미, 자신의 프로젝트에 대한 설명으로
- [x] OOP 방식 학습 및 설계 (class로 작성. 이름 규칙)

## 2. 속성 변경 동작
- [ ] Plane 구조체
- [ ] Plane 유닛 테스트
- [ ] 실행 뒤 새로운 화면 리드미에 추가

## 3. 관찰자 패턴
- [ ] 관찰자 패턴 적용
- [ ] 재고가 추가될 때마다 환면 갱신

# 주요 작업 내용
피드백을 반영한 내용을 작성했습니다.
## 1. 아이패드 앱 프로젝트
### **무작위의 직사각형 생성**
뷰 컨트롤러에서 크기가 같은 무작위의 색과 위치를 갖는 직사각형 인스턴스를 생성합니다.
```swift
override func viewDidLoad() {
        super.viewDidLoad()
        addRandomRectangles(count: 4, size: Size(width: 150, height: 120))
    }
```

### **Id를 생성하는 메소드**
IdGenerator의 static 메소드 generateId를 통해 Id 인스턴스를 생성합니다. length와 separatedAt을 인스턴스로 받으며, length는 '-'를 제외한 글자 수, separatedAt은 최초 몇번째 위치에서 '-'을 추가하고 반복시킬지 결정합니다. 주석처럼  예를 들어 generateId(length: 10, seaparateAt: 4)의 결과물은 123-456-789-1과 같습니다.

### **테스트코드 작성**
generateId를 테스트하는 함수를 작성했습니다.

