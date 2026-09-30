##QuizApp

영단어의 한글 뜻을 맞추는 Web Project입니다. NextJS와 PostgreSQL로만들었습니다.

##주요 기능

1. 영단어를 보고 맞는 뜻을 4개 중에서 선택한다
   
2. 문제를 무작위로 출제되며 답을 선택하면 즉시 정답을 표시한다

3. 끝나면 점수와 오답 목록을 출력한다

4. 기기에 따른 사용자의 기록을 DB에 저장한다

##기술 스택
Framework: NextJS

PL: Typescript

Database: PostgreSQL

+TailwindCSS

##구조

```
src/
  app/
    api/answer/route.ts   정답 채점 API  
    quiz
      page.tsx   문제를 DB에서 Server로 옮긴다 (Server Component)
      QuizClient.tsx   문제 푸는 화면 (Client Component)
    layout.tsx
    page.tsx
  fonts/
  lib/
    db.ts
    user.ts
schema.sql
```

##실행 방법

NodeJS, PostgreSQL

git clone https://github.com/본인 아이디/저장소 이름.git

cd 저장소 이름

npm install

createdb -U postgres QuizDB

psql -U postgres -d QuizDB -f schema.sql

psql이 안 인식되면 bin 폴더의 전체 경로를 넣어서 실행하세요 (예: &C:\Program Files\PostgreSQL\18\bin)

.env

DATABASE_RUL=postgresql://사용자:비밀번호@localhost:5432/QuizDB

npm run dev
