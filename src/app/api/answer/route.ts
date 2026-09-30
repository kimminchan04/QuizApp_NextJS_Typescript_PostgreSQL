import pool from "../../../lib/db"
import {NextRequest, NextResponse} from "next/server"

export async function POST(req: NextRequest) {
    const {wordId, selected, userId} = await req.json();
    const result = await pool.query(
        "select korean_correct from word where id = $1",
        [wordId]
    );
    if (result.rows.length == 0) {

        return NextResponse.json({error: "Word not found"}, {status: 404})
    }
    const correctAnswer = result.rows[0].korean_correct;
    const isCorrect = selected == correctAnswer

    return NextResponse.json({isCorrect, correctAnswer});
}