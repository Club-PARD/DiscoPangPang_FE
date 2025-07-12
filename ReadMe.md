# [PARD 5th] DiscoPangPang_iOS Repository

<img width="5760" height="3240" alt="표지" src="https://github.com/user-attachments/assets/8be67b35-d52a-42aa-b99b-a08c81a3949b" />

> [ 기분 : 기록하고 분석하다 ]  
> 대학생의 경험정리와 강점파악을 도와주는 앱 서비스


## About Service. 'GIBOON'

### Introduction.
  자기 탐색과 진로 개발을 위해 자기 이해를 하고 싶은 대학생들은 경험과 강점을 정리해 표현하는 방법을 몰라 자기분석에 어려움을 겪고 있습니다.
  
  기분은 활동 기록과 강점 분석을 통해 자기분석을 도와주는 서비스입니다.

### Problem.
  (1) 자신의 경험과 강점을 정리하고 표현할 방법을 몰라 자기이해의 어려움을 겪고 있다.
  
  (2) 자신의 경험과 강점을 어떻게 정리하고 표현해야할지 몰라 자소서 작성의 어려움을 느낀다.

### Target.
  (1) 자기 탐색과 진로 개발을 위해 자기 이해를 하고 싶은 대학생
  
  (2) 자소서를 작성하기 위해 (진로를 준비하기 위해) 자기 이해에 대한 필요성을 느끼는 대학생

### Solution.
  (1) `활동등록` : 내가하는 활동에 대해서 간단히 등록한다.
  
  (2) `리마인드 알림` : 마감기한이 지나면 자동으로 기록 리마인드 알림을 준다.
  
  (3) `활동기록` : 제공되는 STARL 템플릿으로 체계적으로 정리한다.
  
  (4) `강점분석` : 활동기록을 분석하여 어떤 부분에서 강점을 가지는지 시각적으로 보여준다.

### As-Is / To-Be
| As-Is | To-Be |
| --- | --- |
| 자신의 경험을 어떻게 정리할지 모른다 | 자신의 경험을 체계적으로 정리한다 |
| 자신의 강점을 알지 못해 어떻게 표현할지 모른다 | 자신의 강점을 알고 표현할 수 있다 |

## About Team. 'DiscoPangPang'
  `유쾌`하고 `열정` 넘치는 팀 분위기와 아이 디어가 `‘팡팡’` 튀어오르는 팀 에너지를 의미

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/8b1f965e-6a1f-4d49-8e36-f510cbcd8d6f" width="250"></td>
    <td><img src="https://github.com/user-attachments/assets/ef56f8ae-9953-42e3-a01a-4040cb3ac506" width="250"></td>
    <td><img src="https://github.com/user-attachments/assets/51b057cc-c418-4f78-a366-97d19f5ebdc0" width="250"></td>
  </tr>
  <tr>
    <td align="center">[  Mascot. 기분이  ]</td>
    <td align="center">[  PM. 이소원  ]</td>
    <td align="center">[  Design. 허준우  ]</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/5f151885-737e-4225-afc8-39676a4d940a" width="250"></td>
    <td><img src="https://github.com/user-attachments/assets/713b0051-090a-483b-bd25-82ed8199516c" width="250"></td>
    <td><img src="https://github.com/user-attachments/assets/7b5b8f4e-b0fc-4118-899c-2f861aeabc92" width="250"></td>
  </tr>
  <tr>
    <td align="center">[  iOS. 임재성  ]</td>
    <td align="center">[  iOS. 조성호  ]</td>
    <td align="center">[  Server. 한규태  ]</td>
  </tr>
</table>


## Features

### (1) 애플 로그인
  애플 로그인을 구현하여 사용자에게 맞는 데이터를 서버에 저장
  
### (2) 활동 등록
  내가 하는 활동에 대한 기본정보 등록 (활동명, 활동기간, 태그 등)

### (3) Notification 알림
  내가 등록한 활동의 마감기한이 지나면 Notification 알림을 통해서 기록 유도

### (4) 활동 기록
  활동을 통해 배운 점들을 기록한다
  - 태그 : 내가 한 활동에서 배운점들을 터치로 쉽게 기록 (직무에 필요한 강점 : 4개 도메인 34개 태그)
  - STARL 기법 : 내가 한 활동에서 배운 점들을 STARL 기법으로 체계적으로 기록

### (5) 활동 분석
  내가 활동에서 각 도메인의 상위 5개의 강점들을 분석하여 시각적으로 제시


## App Flow

- 스플래쉬 뷰 + 애플 로그인 + 홈뷰
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/21356c39-9946-4b20-8790-1d3a7a7dbddb" width="150"></td>
    <td><img src="https://github.com/user-attachments/assets/e660f516-9a36-4ddf-8f0b-74c784ad4a84" width="150"></td>
    <td><img src="https://github.com/user-attachments/assets/640d75fb-64ba-4ef5-b35d-067127c5fb73" width="150"></td>
    <td><img src="https://github.com/user-attachments/assets/65562e14-2786-486e-b2a6-81119d802919" width="150"></td>
  </tr>
  <tr>
    <td align="center">[  스플래쉬 뷰 ]</td>
    <td align="center">[  애플 로그인 1  ]</td>
    <td align="center">[  애플 로그인 2  ]</td>
    <td align="center">[  메인 뷰  ]</td>
  </tr>
</table>

- 활동 등록 + Notification 알림
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/86111f41-70fc-487e-941b-383626273a0b" width="150"></td>
    <td><img src="https://github.com/user-attachments/assets/ad64ca5e-fe64-4aa8-9d02-45ce94d57c97" width="150"></td>
    <td><img src="https://github.com/user-attachments/assets/37dbcd70-f7cd-4e45-a83f-0f9ac02d0c15" width="150"></td>
    <td><img src="https://github.com/user-attachments/assets/b00ff96f-25cf-4065-b959-66140c02b0aa" width="150"></td>
    <td><img src="https://github.com/user-attachments/assets/102ed8e0-4a4f-4f89-9ab1-63ed31e4500e" width="150"></td>
    <td><img src="https://github.com/user-attachments/assets/460b3c72-6dc7-45b6-ab96-36e54a4dbab1" width="150"></td>
  </tr>
  <tr>
    <td align="center">[  활동등록  ]</td>
    <td align="center">[  태그선택 1  ]</td>
    <td align="center">[  태그선택 2  ]</td>
    <td align="center">[  태그선택 3  ]</td>
    <td align="center">[  태그선택 4  ]</td>
    <td align="center">[  Notification 알림  ]</td>
  </tr>
</table>

- 활동 기록
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/e612bd41-939b-49e0-8fa5-03aaaa06a48f" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/ed55bc4a-9164-4256-98a4-4efb85d44223" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/e5bf6d07-01a9-4ef1-84b3-efc0129833cd" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/bcc0c684-523e-42b4-8ab5-947e29a265f2" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/5989773c-95a9-4201-b77f-b390528926aa" width="300"></td>
  </tr>
  <tr>
    <td align="center">[  질문 1  ]</td>
    <td align="center">[  질문 2  ]</td>
    <td align="center">[  질문 3  ]</td>
    <td align="center">[  질문 4  ]</td>
    <td align="center">[  질문 5  ]</td>
  </tr>
</table>

- 히스토리
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/7c9d1d25-3c67-4455-930f-9d341297739e" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/62a256b3-2955-427b-8c52-4979f92f1105" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/16ce6a51-a9f7-451c-9a2d-eb1c172b3ac1" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/ba74423c-f65e-47f9-b192-88b4b4950351" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/41a766c2-d8b0-423a-a460-baac624b9709" width="300"></td>
  </tr>
  <tr>
    <td align="center">[  히스토리 뷰  ]</td>
    <td align="center">[  히스토리 1  ]</td>
    <td align="center">[  히스토리 2  ]</td>
    <td align="center">[  히스토리 3  ]</td>
    <td align="center">[  히스토리 4  ]</td>
  </tr>
</table>

- 활동 분석
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/e616f853-98ad-412f-9ee2-38dce296c54c" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/437ec0ca-b7fc-40c1-8d1d-5370abb0b0cb" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/9cdebc8c-4b84-4cc2-b3d8-1d35bd9d6244" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/d1de9a94-fd81-4333-8e4e-c3cd6e8c2b7c" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/8ead02cb-2695-46a5-807d-773fea0cdc60" width="300"></td>
  </tr>
  <tr>
    <td align="center">[  활동분석 뷰  ]</td>
    <td align="center">[  활동분석 1  ]</td>
    <td align="center">[  활동분석 2  ]</td>
    <td align="center">[  활동분석 3  ]</td>
    <td align="center">[  활동분석 4  ]</td>
  </tr>
</table>


## Tech Stack

### FrontEnd.
<p>
  <img src="https://img.shields.io/badge/iOS-000000?style=flat&logo=apple&logoColor=white"/>
  <img src="https://img.shields.io/badge/Swift-FA7343?style=flat&logo=swift&logoColor=white"/>
  <img src="https://img.shields.io/badge/SwiftUI-2E86C1?style=flat&logo=swift&logoColor=white"/>
</p>

### BackEnd.
<p>
  <img src="https://img.shields.io/badge/Java-007396?style=flat&logo=OpenJDK&logoColor=white"/>
  <img src="https://img.shields.io/badge/Spring%20Boot-6DB33F?style=flat&logo=springboot&logoColor=white"/>
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white"/>
  <img src="https://img.shields.io/badge/AWS-232F3E?style=flat&logo=Amazon%20AWS&logoColor=white"/>
  <img src="https://img.shields.io/badge/EC2-FF9900?style=flat&logo=Amazon%20EC2&logoColor=white"/>
</p>
  
### Collaboration Tools.
<p>
  <img src="https://img.shields.io/badge/Slack-4A154B?style=flat&logo=Slack&logoColor=white"/>
  <img src="https://img.shields.io/badge/Notion-000000?style=flat&logo=Notion&logoColor=white"/>
  <img src="https://img.shields.io/badge/Figma-F24E1E?style=flat&logo=Figma&logoColor=white"/>
  <img src="https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white"/>
  <img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white"/>
</p>


## App Link

배포 예정.

---

# Thank you! :)



