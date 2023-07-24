const oracledb = require('oracledb');
const email = "";

$('#btnEmail').on('click', () => {
    email = $('#email').val();
    console.log("OK");
    console.log(email);
    // 이메일로 계정번호 가져오기

    async function insertDataIntoOracleDB(data) {
        const user = process.env.ORACLE_USER; // 시스템 변수에 값을 넣어서 보안에 신경 씀(하드 코딩을 하면 보안에 취약함)
        const password = process.env.ORACLE_PASSWORD; // 어떤 계정 쓰는 지 몰라서 아직 값은 않 넣어둔 상태
        try {
          const connection = await oracledb.getConnection({
            user: user,
            password: password,
            connectString: '연결_문자열',
          })
          const sql2 = 'SELECT a_no FROM ACCOUNT WHERE a_email = (:a_email)';
          const binds2 = {
              a_email: email  // 해당 부분을 잘 모르겠음
          };
          const a_no = await connection.execute(sql2, binds2);
          console.log(email);
        } catch (error) {
            console.error('데이터를 삽입하는 중 오류가 발생했습니다(insertDataIntoOracleDB):', error);
    }

    if(a_no != null){
        console.log('email: '+email);
        console.log('a_no: '+a_no);
        $('#OKEmail').show();
        $('#insertEmail').hide();
        return a_no;
    }else{
        alert('확인되지 않은 이메일입니다. 회원가입하시거나 다시 입력해주세요.');
    }
}
    
});