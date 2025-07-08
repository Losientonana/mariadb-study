## **8. 프로시저**

<details><summary>1. 회원</summary>

<details><summary>1. 회원가입을 통해 user entity에 회원이 등록되어야 한다</summary>
- 회원 가입
    - 기존 데이터  
        (이미지)
    - 회원 추가 프로시저 생성  
        (이미지)
    - 프로시저 실행 결과  
        (이미지)
</details>

<details><summary>2. 회원 정보를 수정한다 (닉네임, 비밀번호, 프로필사진)</summary>
- 회원 정보 수정
    - 기존 데이터  
        (이미지)
    - 프로시저  
        (이미지)
    - 실행 후 결과 값  
        (이미지)
</details>

<details><summary>3. 회원이 탈퇴하면 계정을 삭제한다</summary>
- 회원 삭제
    - 기존 데이터  
        (이미지)
    - 프로시저  
        (이미지)
    - 실행 결과  
        (이미지)
</details>

<details><summary>4. 회원의 이메일/비밀번호를 찾는다</summary>
- 회원의 이메일 찾기
    - 프로시저  
        (이미지)
    - 결과  
        (이미지)
- 회원의 비밀번호 찾기
    - 프로시저  
        (이미지)
    - 결과  
        (이미지)
</details>

</details>

<details><summary>2. 공연</summary>
<details><summary>1. 공연 목록/검색 (필터 조건: 공연명, 일정, 장소 등)</summary>
- 사용자에 요구사항에 맞는 공연 목록 조회
    - 프로시저  
        (이미지)
    - 실행 결과  
        - 전체 공연 조회  
            (이미지)
        - 공연명 ‘뮤지컬’ 포함 공연 전체 조회  
            (이미지)
        - 공연장명 ‘인천시립극장’인 공연만 조회  
            (이미지)
</details>

<details><summary>2. 공연 상세 조회 (공연 PK, 공연명, 일정 등)</summary>
- 프로시저  
    (이미지)
- 실행 결과  
    - "뮤직밤 클래식" 상세정보  
        (이미지)
    - 기타 공연 상세정보  
        (이미지)
</details>
</details>

<details><summary>3. 예매</summary>
<details><summary>1. 공연 예매 등록 (회원, 공연, 좌석, 예매일 등)</summary>
- 예매 등록 프로시저  
    (이미지)
- 실행 결과  
    (이미지)
</details>

<details><summary>2. 특정 사용자의 예매 내역 전체 조회</summary>
- 프로시저  
    (이미지)
- 실행 결과  
    (이미지)
</details>

<details><summary>3. 내가 등록한 예매 삭제하기</summary>
- 프로시저  
    (이미지)
- 실행 결과  
    (이미지)
</details>

<details><summary>4. 내가 등록한 예매 수정</summary>
- 기존 데이터  
    (이미지)
- 프로시저  
    (이미지)
- 실행 결과  
    (이미지)
- 중복 예매 시 실행 결과  
    (이미지)
</details>
</details>

<details><summary>4. 북마크</summary>
<details><summary>1. 공연 북마크 등록</summary>
- 프로시저  
    (이미지)
- 실행 결과  
    (이미지)
</details>

<details><summary>2. 회원별 북마크 내역 전체 조회</summary>
- 프로시저  
    (이미지)
- 실행 결과  
    (이미지)
</details>

<details><summary>3. 공연 북마크 해체</summary>
- 프로시저  
    (이미지)
- 실행 결과  
    (이미지)
</details>
</details>

<details><summary>5. 리뷰</summary>
<details><summary>1. 공연 리뷰 등록 (별점, 한줄평, 사진 등)</summary>
- 프로시저  
    (이미지)
- 실행 결과  
    (이미지)
</details>

<details><summary>2. 내 리뷰 확인하기 (모든 리뷰 보기)</summary>
- 프로시저  
    (이미지)
- 실행 결과  
    (이미지)
</details>

<details><summary>3. 좋아요/싫어요 많은 순으로 정렬</summary>
- 좋아요 순 정렬  
    (이미지)
    - 결과  
        (이미지)
- 싫어요 순 정렬  
    (이미지)
    - 결과  
        (이미지)
</details>

<details><summary>4. 리뷰 삭제</summary>
- 프로시저  
    (이미지)
- 실행 결과  
    (이미지)
</details>

<details><summary>5. 리뷰 좋아요/싫어요</summary>
- 프로시저  
    (이미지)
- 실행 결과  
    (이미지)
</details>
</details>

<details><summary>6. 관심사</summary>
<details><summary>1. 회원의 관심 장르 등록/수정</summary>
- 변경 전  
    (이미지)
- 프로시저  
    (이미지)
- 변경 후  
    (이미지)
</details>

<details><summary>2. 회원의 관심 퍼포머 등록/수정</summary>
- 변경 전  
    (이미지)
- 프로시저  
    (이미지)
- 변경 후  
    (이미지)
</details>
</details>

<details><summary>7. 알림</summary>
<details><summary>1. 알림 등록</summary>
- 변경 전  
    (이미지)
- 프로시저  
    (이미지)
- 새 알림 등록  
    (이미지)
</details>

<details><summary>2. 알림 전체 조회</summary>
- 프로시저  
    (이미지)
- 기능  
    (이미지)
</details>

<details><summary>3. 예매한 공연의 하루 전 날 알림 발송</summary>
- 공연 시작 날짜  
    (이미지)
- 프로시저  
    (이미지)
- 결과  
    (이미지)
</details>

<details><summary>4. 예매 당일 공연 시작 전 알림 발송</summary>
- 공연 시작 시간  
    (이미지)
- 프로시저  
    (이미지)
- 결과  
    (이미지)
</details>

<details><summary>5. 북마크 공연 티켓팅 하루 전 알림 발송</summary>
- 티켓팅 시작일  
    (이미지)
- 프로시저  
    (이미지)
- 결과  
    (이미지)
</details>
</details>

<details><summary>8. 추천</summary>
<details><summary>1. 좋아하는 장르의 공연 추천</summary>
- 프로시저  
    (이미지)
- 결과  
    (이미지)
</details>

<details><summary>2. 좋아하는 퍼포머의 공연 정보 추천</summary>
- 프로시저  
    (이미지)
- 결과  
    (이미지)
</details>
</details>
