import pool, {WordRow} from "../../lib/db"
import QuizClient from "./QuizClient";

export type QuizQuestion = {
    wordId: number;
    english: string;
    choices: string[];
}

export default async function Page() {
    const result = await pool.query<WordRow>(
        "Select id, english, korean_correct, korean_wrong from word order by random() limit 10"
    );
    const questions: QuizQuestion[] = result.rows.map((word) => ({
        wordId: word.id,
        english: word.english,
        choices: [word.korean_correct, ...word.korean_wrong].sort(() => Math.random() - 0.5)
    }));

    return <QuizClient questions={questions}/>
}