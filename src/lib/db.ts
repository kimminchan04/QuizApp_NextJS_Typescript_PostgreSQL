import {Pool} from "pg";

const pg = new Pool({
    connectionString: process.env.DATABASE_URL
})

export default pg;

export type WordRow = {
    id: number;
    english: string;
    korean_correct: string;
    korean_wrong: string[];
}