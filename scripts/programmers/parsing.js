/*
  문제가 맞았다면 문제 관련 데이터를 파싱하는 함수의 모음입니다.
  모든 해당 파일의 모든 함수는 parseData()를 통해 호출됩니다.
*/

//html문서에서 데이터 추출하는 함수
async function parseData() {
  // <meta> 태그의 내용을 가져와 URL을 추출
  const link = document.querySelector('head > meta[name$=url]').content.replace(/\?.*/g, '').trim();

  // 문제 번호를 추출
  const problemId = document.querySelector('div.main > div.lesson-content').getAttribute('data-lesson-id');

  // levels 객체에서 레벨을 가져온다. 만약 찾지 못할 경우 'unrated'
  const level = levels[problemId] || 'unrated';

  // HTML 문서에서 breadcrumb 탐색 요소로부터 구분을 추출합니다.
  const division = [...document.querySelector('ol.breadcrumb').childNodes]
    .filter((x) => x.className !== 'active')
    .map((x) => x.innerText)
    .map((x) => convertSingleCharToDoubleChar(x))
    .reduce((a, b) => `${a}/${b}`);

  // 문제 제목을 추출
  const title = document.querySelector('#tab > li.algorithm-title').textContent.replace(/\\n/g, '').trim();

  // 문제 설명을 추출
  const problem_description = document.querySelector('div.guide-section-description > div.markdown').innerHTML;

  // 파일 확장자를 추출
  const language_extension = document.querySelector('div.editor > ul > li.nav-item > a').innerText.split('.')[1];

  // 코드를 추출
  const code = document.querySelector('textarea#code').value;

  // 결과 메시지를 추출 나중 함수를 위해서 형식 조정
  const result_message =
    [...document.querySelectorAll('#output > pre.console-content > div.console-message')]
      .map((x) => x.innerText)
      .filter((x) => x.includes(': '))
      .reduce((x, y) => `${x}<br/>${y}`, '') || 'Empty';

  // 실행 시간과 메모리 값 추출 후  형식화
  const [runtime, memory] = [...document.querySelectorAll('td.result.passed')]
    .map((x) => x.innerText)
    .map((x) => x.replace(/[^., 0-9a-zA-Z]/g, '').trim())
    .map((x) => x.split(', '))
    .reduce((x, y) => (Number(x[0]) > Number(y[0]) ? x : y), ['0.00ms', '0.0MB'])
    .map((x) => x.replace(/(?<=[0-9])(?=[A-Za-z])/, ' '));

  // 추출한 데이터 결과를 반환
  return makeData({ link, problemId, level, title, problem_description, division, language_extension, code, result_message, runtime, memory });
}

export { link, problemId, level, title, problem_description, language_extension, code, runtime, memory };
