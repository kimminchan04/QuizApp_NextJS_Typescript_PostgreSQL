"use client"
import {useState} from "react";
import {useRouter} from "next/navigation";
import Link from "next/link";
import { QuizQuestion } from "./page";
import {getUser} from "../../lib/user"

type Props = {
    questions: QuizQuestion[];
}

type Wrong = {
    english: string;
    myAnswer: string;
    correctAnswer: string;
}

export default function QuizClient({questions}: Props) {
    const router = useRouter();
    const [currentIndex, setCurrentIndex] = useState(0);
    const [score, setScore] = useState(0);
    const [result, setResult] = useState<"correct" | "wrong" | null>(null);
    const [selected, setSelected] = useState<string | null>(null);
    const [correctAnswer, setCorrectAnswer] = useState<string | null>(null);
    const [finished, setFinished] = useState(false);
    const [Wrong, setWrong] = useState<Wrong[]>([]);
    const current = questions[currentIndex];
    const isLastQuestion = currentIndex == questions.length - 1;
    async function handleAnswer(choice: string) {
        setSelected(choice);
        const res = await fetch("/api/answer", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({wordId: current.wordId, selected: choice, userId: getUser()})
        });
        const data = await res.json();
        setCorrectAnswer(data.correctAnswer);
        setResult(data.isCorrect ? "correct" : "wrong");
        if (data.isCorrect) {
            setScore((prev) => prev + 1);
        } else {
            setWrong((prev) => [
                ...prev,
                {
                    english: current.english,
                    myAnswer: choice,
                    correctAnswer: data.correctAnswer
                }
            ])
        }
    }
    function handleNext() {
        if (isLastQuestion) {
            setFinished(true);

            return;
        }
        setCurrentIndex((prev) => prev + 1);
        setResult(null);
        setSelected(null);
        setCorrectAnswer(null);
    }

    if (!finished) {
        return (
        <div className="m-3 max-w-3xl mx-auto">
            <div className="flex justify-center p-3 text-2xl">Quiz</div>
            <div className="flex justify-center">이 단어의 한글 뜻을 맞춰 보세요!</div>
            <div className="m-3">{currentIndex + 1} / {questions.length}</div>
            <div className="m-3">점수: {score}</div>
            <div className="flex justify-center text-2xl m-5 font-bold">{current.english}</div>
            {current.choices.map((choice) => (
            <button key={choice}
                onClick={() => handleAnswer(choice)}
                disabled={result != null && selected != null}
                className={`
                flex justify-center px-4 py-2 font-bold text-xl m-5 border-2 border-gray-500 cursor-pointer rounded-xl hover:text-gray-500
                ${result != null && selected == choice ? result == "correct" ? "bg-green-500" : "bg-red-500": ""}
                `}
            >
                {choice}
            </button>
            ))}      
            <div className="flex justify-center">
            {result && (
                result == "correct" ? <div>맞추었습니다!🎉</div> : <div>틀렸습니다. 정답은 {correctAnswer}입니다.❎</div>
            )}
            </div>
            <div className="flex justify-between m-7">
            <Link href="/" className="rounded-xl text-white bg-blue-500 hover:bg-blue-300 px-4 py-2 hover:text-black shadow-lg">
                홈으로
            </Link>
            <button onClick={() => handleNext()} 
                disabled={result == null}
                className="cursor-pointer rounded-xl text-white bg-blue-500 hover:bg-blue-300 px-4 py-2 hover:text-black shadow-lg">
                {isLastQuestion? "결과 보기": "다음 문제"}
            </button>
            </div>
        </div>
        )
    } else {

        return (
        <div className="m-3 max-w-3xl mx-auto">
            <div className="flex justify-center p-3 text-2xl">Quiz Complete!</div>
            <div className="flex justify-center">{questions.length}개 문제 중에서 {score}개 맞추셨습니다!🎉</div>
            {Wrong.length > 0 && (
                <div className="m-5">
                    <div className="text-xl m-3">오답 목록❎</div>
                    {Wrong.map((w) => (
                        <div className="mb-3 p-2 border-2 rounded-2xl border-gray-500 shadow-md">
                            <div>문제: {w.english}</div>
                            <div>정답: {w.correctAnswer}</div>
                            <div>고르신 답: {w.myAnswer}</div>
                        </div>
                    ))}
                </div>
            )}
            <div className="flex justify-between m-7">
                <Link href="/" className="rounded-xl text-white bg-blue-500 hover:bg-blue-300 px-4 py-2 hover:text-black shadow-lg">
                    홈으로
                </Link>
            </div>
        </div>
        )
    }
}