// 콘솔 로그를 활성화
const debug = false;

/* 
  문제 제출 맞음 여부를 확인하는 함수
  2초마다 문제를 파싱하여 확인
*/
let loader;

const currentUrl = window.location.href;

// 프로그래머스 연습 문제 주소임을 확인하고, 맞다면 로더를 실행
if (currentUrl.includes('/learn/courses/30') && currentUrl.includes('lessons')) startLoader();

// 문제를 파싱하고 2초마다 제출 여부 확인하는 함수
function startLoader() {
  loader = setInterval(async () => {
    // 기능 Off시 작동하지 않도록 함
    const enable = await checkEnable();
    if (!enable) stopLoader();
    // 제출 후 채점하기 결과가 성공적으로 나왔다면 코드를 파싱하고, 업로드를 시작한다
    else if (getSolvedResult().includes('정답')) {
      log('정답이 나왔습니다. 업로드를 시작합니다.');
      stopLoader();
      try {
        const insertData = await parseData();
        await insertDataIntoOracleDB(insertData);
      } catch (error) {
        log(error);
      }
    }
  }, 2000);
}

// startLoader를 정지하는 함수
function stopLoader() {
  clearInterval(loader);
}

// 채점 결과를 확인 하는 함수 통과하면 해당 문구를 가져오고 실패 시 ''반환
function getSolvedResult() {
  const result = document.querySelector('div.modal-header > h4');
  if (result) return result.innerText;
  return '';
}

// 파싱 직후 실행되는 함수 정답이 확인되면 실행(업로드)
async function beginUpload(insertData) {
  log('bojData', insertData);
  if (isNotEmpty(insertData)) {
    startUpload();

    const stats = await getStats();
    const hook = await getHook();
    // 현재 버전을 할당
    const currentVersion = stats.version;
    /* 버전 차이가 발생하거나, 해당 hook에 대한 데이터가 없는 경우 localstorage의 Stats 값을 업데이트하고, version을 최신으로 변경한다 */
    if (isNull(currentVersion) || currentVersion !== getVersion() || isNull(await getStatsSHAfromPath(hook))) {
      await versionUpdate();
    }

    /* 현재 제출하려는 소스코드가 기존 업로드한 내용과 같다면 중지 */
    cachedSHA = await getStatsSHAfromPath(`${hook}/${insertData.directory}/${insertData.fileName}`);
    calcSHA = calculateBlobSHA(insertData.code);
    log('cachedSHA', cachedSHA, 'calcSHA', calcSHA);
    if (cachedSHA == calcSHA) {
      markUploadedCSS();
      console.log(`현재 제출번호를 업로드한 기록이 있습니다. problemIdID ${insertData.problemId}`);
      return;
    }
    /* 신규 제출 번호라면 새롭게 커밋  */
    // await uploadOneSolveProblemOnGit(bojData, markUploadedCSS); 깃허브에 커밋하는 함수라 필요없음
  }
}

// 버전 업데이트 해주는 함수 github repo파일을 가지고 와서 거기에 버전을 확인해서 버전을 업데이트 해주는 함수
// async function versionUpdate() {
//   log('start versionUpdate');
//   const stats = await updateLocalStorageStats();
//   // update version.
//   stats.version = getVersion();
//   await saveStats(stats);
//   log('stats updated.', stats);
// }
