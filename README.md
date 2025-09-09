# BLoC Exercise

BLoC 패턴 연습 애플리케이션

## 프로젝트 소개

Flutter에서 BLoC (Business Logic Component) 패턴을 학습하고 연습하기 위한 예제 애플리케이션입니다. 카운터와 타이머 기능을 통해 BLoC 패턴의 기본 개념과 상태 관리 방법을 학습할 수 있습니다.

## 주요 기능

### Counter 앱
- 증가/감소 버튼으로 숫자 조작
- BLoC 패턴을 활용한 상태 관리
- 이벤트 기반 상태 업데이트

### Timer 앱
- 시간 측정 기능
- 시작/일시정지/재설정 기능
- 실시간 상태 업데이트

### 인증 시스템
- Firebase Authentication 연동
- Google 소셜 로그인
- 사용자 상태 관리

### Todo 관리
- Firebase Firestore 기반 할일 관리
- 실시간 데이터 동기화
- CRUD 작업

## 기술 스택

- **프레임워크**: Flutter 2.x
- **언어**: Dart 2.1+
- **상태관리**: BLoC Pattern (flutter_bloc 2.0.0)
- **백엔드**: Firebase
  - Firebase Core 0.2.5+1
  - Firebase Authentication 0.7.0
  - Cloud Firestore 0.8.2+1
- **인증**: Google Sign-In 3.2.4
- **기타**: 
  - Equatable 0.6.0 (상태 비교)
  - Wave 0.0.8 (애니메이션)
  - Font Awesome Flutter 8.4.0

## BLoC 패턴 구조

### 아키텍처 계층
```
lib/
├── app.dart                           # 앱 설정
├── blocs/                            # BLoC 계층
│   ├── authentication_bloc/          # 인증 BLoC
│   ├── authentication_todo_bloc/     # Todo 인증 BLoC
│   ├── data_bloc/                   # 데이터 BLoC
│   ├── login_bloc/                  # 로그인 BLoC
│   ├── simple_bloc_delegate/        # BLoC 델리게이트
│   ├── timer_bloc/                  # 타이머 BLoC
│   └── todos_bloc/                  # Todo BLoC
└── screens/                         # UI 화면들
```

### Repository 패턴
```
todos_repository/                    # Todo 데이터 저장소
user_repository/                     # 사용자 데이터 저장소
```

## 학습 내용

### BLoC 패턴 기초
- **Event**: 사용자 액션을 나타내는 이벤트
- **State**: 앱의 상태를 나타내는 데이터
- **BLoC**: 이벤트를 받아 상태를 생성하는 비즈니스 로직

### 상태 관리 방법
```dart
// Event 정의
abstract class CounterEvent extends Equatable {}

// State 정의  
abstract class CounterState extends Equatable {}

// BLoC 구현
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // 이벤트 처리 로직
}
```

### Firebase 연동
- Authentication을 통한 사용자 관리
- Firestore를 활용한 데이터 저장
- 실시간 데이터 동기화

## 예제 기능

### 1. Counter BLoC
- 증가 이벤트 처리
- 감소 이벤트 처리
- 상태 변화 감지

### 2. Timer BLoC
- 타이머 시작/정지
- 시간 업데이트 스트림
- 리셋 기능

### 3. Authentication BLoC
- 로그인/로그아웃 처리
- 사용자 상태 관리
- Google 인증 연동

### 4. Todos BLoC
- 할일 추가/삭제
- 완료 상태 토글
- 필터링 기능

## 설치 및 실행

### 사전 요구사항
- Flutter 2.x 이상
- Dart 2.1 이상
- Firebase 프로젝트 설정

### 설치 방법
```bash
# 의존성 설치
flutter pub get

# 로컬 패키지 의존성 설치
cd todos_repository && flutter pub get
cd ../user_repository && flutter pub get
cd ..

# 앱 실행
flutter run
```

### Firebase 설정
1. Firebase 콘솔에서 프로젝트 생성
2. google-services.json 파일 추가
3. Authentication 및 Firestore 활성화

## 학습 목표

### BLoC 패턴 이해
- 단방향 데이터 플로우
- 이벤트 기반 아키텍처
- 상태와 UI 분리

### 실전 적용
- 실제 앱에서의 BLoC 사용법
- Firebase와의 연동 방법
- 복잡한 상태 관리 방법

## 개발 환경

- **Flutter SDK**: 2.x
- **IDE**: Android Studio / VS Code
- **아키텍처**: BLoC Pattern
- **백엔드**: Firebase

## 참고 자료

- Flutter Architecture Samples (Felix Angelov)
- BLoC Library Documentation
- Firebase Flutter 공식 문서

## 버전 정보

현재 버전: 1.0.0+1