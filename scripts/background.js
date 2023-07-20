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

    /* Go to onboarding for UX */
    const urlOnboarding = `chrome-extension://${chrome.runtime.id}/welcome.html`;
    chrome.tabs.create({ url: urlOnboarding, selected: true }); // creates new tab
  } else if (request && request.closeWebPage === true && request.isSuccess === false) {
    alert('Something went wrong while trying to authenticate your profile!');
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
