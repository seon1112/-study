const oracledb = require('oracledb');

import { level, title, problem_description, language_extension, code, runtime, memory } from './parsing.js';
import { elapsedTime } from './stopwatch.js';

async function insertDataIntoOracleDB(data) {
  try {
    const connection = await oracledb.getConnection({
      user: '사용자명',
      password: '비밀번호',
      connectString: '연결_문자열',
    });

    const sql = `INSERT INTO coding_test (ct_no, a_no, p_title, p_level, p_timer, p_time, p_memory, p_code, p_content, p_date, p_lang) VALUES (:ctNo, :aNo, :pTitle, :pLevel, :pTimer, :pTime, :pMemory, :pCode, :pContent, :pDate, :pLang)`;

    const elapsedTime = stopwatch.times.join(':'); // 시간 형식을 ':'로 연결하여 문자열로 변환

    // SQL 문에 값을 바인딩
    const binds = {
      ctNo: 1,
      aNo: 1,
      pTitle: data.title,
      pLevel: data.level,
      pTimer: data.Stopwatch,
      pTime: data.elapsedTime,
      pMemory: data.memory,
      pCode: data.code,
      pContent: data.problem_description,
      pDate: { type: oracledb.DATE, dir: oracledb.BIND_IN, val: new Date() },
      pLang: data.language_extension,
    };

    // SQL 문을 실행
    const result = await connection.execute(sql, binds, { autoCommit: true });

    console.log('데이터가 성공적으로 삽입되었습니다.');

    // 연결을 종료합니다.
    await connection.close();
  } catch (error) {
    console.error('데이터를 삽입하는 중 오류가 발생했습니다(insertDataIntoOracleDB):', error);
  }
}

const data = {
  level: level,
  title: title,
  problem_description: problem_description,
  language_extension: language_extension,
  code: code,
  runtime: runtime,
  memory: memory,
};
insertDataIntoOracleDB(data);
