/**
 * solvedac 문제 데이터를 파싱해 오는 함수.
 * @param {int} problemId
 */
// async function SolvedApiCall(problemId) { 백준 문제 같은 경우에는 solved사이트에서 관리하기(?) 때문에 허브를 깔기 전 백준 코테를 풀었을 경우 해당 문제를 번호를 가져온다
//   // solved.ac API에 문제 ID를 이용해 문제 정보를 요청하고 결과를 JSON 형식으로 반환합니다.
//   return fetch(`https://solved.ac/api/v3/problem/show?problemId=${problemId}`, { method: 'GET' }).then((query) => query.json());
// }
// BaekjoonHub_username, BaekjoonHub_token, pipe_BaekjoonHub는 로컬 저장소에 저장되는 키(key)의 이름
function handleMessage(request, sender, sendResponse) {
  // 인증에 성공한 경우(웹 페이지를 닫아야 하고, 인증이 성공적으로 완료되었음)
  if (request && request.closeWebPage === true && request.isSuccess === true) {
    // 사용자 이름을 설정합니다.
    chrome.storage.local.set({ PodoFarm_username: request.username });

    // 인증 토큰을 설정합니다.
    chrome.storage.local.set({ PodoFarm_token: request.token });

    // 파이프를 닫습니다.
    chrome.storage.local.set({ pipe_PodoFarm: false }, () => {
      console.log('Closed pipe.');
    });

    // 사용자 경험을 위해 온보딩(환영)페이지로 이동합니다.

    const urlOnboarding = `chrome-extension://${chrome.runtime.id}/welcome.html`; // html페이지 변경 해야 됨일부로 오류냄
    chrome.tabs.create({ url: urlOnboarding, selected: true }); // 새 탭을 생성합니다.
  }
  // 인증에 실패한 경우(웹 페이지를 닫아야 함)
  else if (request && request.closeWebPage === true && request.isSuccess === false) {
    alert('프로필 인증 중 문제가 발생했습니다!');
    chrome.tabs.getSelected(null, function (tab) {
      chrome.tabs.remove(tab.id);
    });
  }
  // solved.ac API 호출을 요청한 경우
  // else if (request && request.sender == 'baekjoon' && request.task == 'SolvedApiCall') {
  //   SolvedApiCall(request.problemId).then((res) => sendResponse(res));
  // }
  return true;
}

// 메시지 수신 대기
chrome.runtime.onMessage.addListener(handleMessage);
