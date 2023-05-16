# 🥕 Carrot_iOS
바니바니바니바니당근마켓ㅋㅋ

## 📜 프로젝트 설명
~~~
GO SOPT 32기 합동세미나 모바일 4조
당근마켓 리디자인
~~~

## 💻 Developer
* 정채은 [chaentopia](https://github.com/chaentopia) 
* 김창균 [ckkim817](https://github.com/ckkim817)
* 박윤빈 [binisnull](https://github.com/binisnull)

## 📚 Library
~~~
1. Alamofire
  - 서버 통신을 위한 라이브러리
  
2. KingFisher
  - 서버 통신의 이미지를 가져오기 위한 라이브러리
  
3. SnapKit
  - Code base 개발을 원활하게 도와주는 라이브러리

4. Then
  - Code base 개발을 원활하게 도와주는 라이브러리
~~~

## 🔐 Code Convention
[코드 컨벤션](https://acute-valley-777.notion.site/Code-Convention-66521caebd1f4ed88e8ff0c6ddb64d6f)

## 🪶 Git Convention
[깃 컨벤션](https://acute-valley-777.notion.site/Git-Convention-91ec0f814d3f459994edf10b3019a287)

## ✒️ Code Review Convention
[뱅크 샐러드 코드리뷰 컨벤션](https://blog.banksalad.com/tech/banksalad-code-review-culture/)
```
**P1: 꼭 반영해주세요 (Request changes)**
리뷰어는 PR의 내용이 서비스에 중대한 오류를 발생할 수 있는 가능성을 잠재하고 있는 등 중대한 코드 수정이 반드시 필요하다고 판단되는 경우, P1 태그를 통해 리뷰 요청자에게 수정을 요청합니다. 리뷰 요청자는 p1 태그에 대해 리뷰어의 요청을 반영하거나, 반영할 수 없는 합리적인 의견을 통해 리뷰어를 설득할 수 있어야 합니다.

**P2: 적극적으로 고려해주세요 (Request changes)**
작성자는 P2에 대해 수용하거나 만약 수용할 수 없는 상황이라면 적합한 의견을 들어 토론할 것을 권장합니다.

**P3: 웬만하면 반영해 주세요 (Comment)**
작성자는 P3에 대해 수용하거나 만약 수용할 수 없는 상황이라면 반영할 수 없는 이유를 들어 설명하거나 다음에 반영할 계획을 명시적으로(JIRA 티켓 등으로) 표현할 것을 권장합니다. Request changes 가 아닌 Comment 와 함께 사용됩니다.

**P4: 반영해도 좋고 넘어가도 좋습니다 (Approve)**
작성자는 P4에 대해서는 아무런 의견을 달지 않고 무시해도 괜찮습니다. 해당 의견을 반영하는 게 좋을지 고민해 보는 정도면 충분합니다.

**P5: 그냥 사소한 의견입니다 (Approve)**
작성자는 P5에 대해 아무런 의견을 달지 않고 무시해도 괜찮습니다.
```


## 📂 Project Structure
~~~
📦 Carrot_iOS
┣ 📂 Storyboard
┃ ┣ 📜 LaunchScreen.swift
┃
┣ 📂 Application
┃ ┣ 📜 AppDelegate.swift
┃ ┣ 📜 SceneDelegate.swift
┃
┣ 📂 Resource
┃ ┣ 📂 Fonts
┃ ┣ 📜 Assets.xcassets
┃ ┣ 📜 Colors.xcassets
┃ ┣ 📜 info.plist
┃
┣ 📂 Common
┃ ┣ 📂 Consts
┃ ┣ 📂 Extensions
┃
┣ 📂 Presentation
┃ ┣ 📂 Base
┃ ┣ 📂 Home
┃ ┣ 📂 Sale
┃ ┣ 📂 Chat
┃ ┣ 📂 Review
┃
┣ 📂 Network
┃ ┣ 📂 Home
┃ ┣ 📂 Sale
┃ ┣ 📂 Chat
┃ ┣ 📂 Review
┣ 📂 Data
┃ ┣ 📂 Home
┃ ┣ 📂 Sale
┃ ┣ 📂 Chat
┃ ┣ 📂 Review
~~~

## Role
### 정채은
* 채팅: Chat
* 헤더뷰

### 김창균
* 홈: Home
* 리뷰: Review

### 박윤빈
* 판매상품: Sale

## Trouble Shooting
[트러블 슈팅 템플릿](https://acute-valley-777.notion.site/Trouble-Shooting-fad91b9cd2134963b14dfba6a0ec80ef)
