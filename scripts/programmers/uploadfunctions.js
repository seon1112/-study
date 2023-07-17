/** 푼 문제들에 대한 단일 업로드는 uploadGit 함수로 합니다.
 * 파라미터는 아래와 같습니다.
 * @param {string} filePath - 업로드할 파일의 경로
 * @param {string} sourceCode - 업로드하는 소스코드 내용
 * @param {string} readme - 업로드하는 README 내용
 * @param {string} filename - 업로드할 파일명
 * @param {string} commitMessage - 커밋 메시지
 * @param {function} cb - 콜백 함수 (ex. 업로드 후 로딩 아이콘 처리 등)
 * @returns {Promise<void>}
 */

async function uploadOneSolveProblemOnGit(bojData, cb) {
  // Git에 업로드하기 위해 필요한 토큰을 얻어옵니다.
  const token = await getToken();
  // Git 훅을 가져옵니다.
  const hook = await getHook();
  // 토큰이나 훅이 없을 경우 오류를 출력하고 종료합니다.
  if (isNull(token) || isNull(hook)) {
  console.error('토큰 또는 훅이 null입니다.', token, hook);
  return;
  }
  // 업로드 함수를 호출하고 결과를 반환합니다.
  return upload(token, hook, bojData.code, bojData.readme, bojData.directory, bojData.fileName, bojData.message, cb);
  }
  
  
  /** Github api를 사용하여 업로드를 합니다.
   * @see https://docs.github.com/en/rest/reference/repos#create-or-update-file-contents
   * @param {string} token - github api 토큰
   * @param {string} hook - github api hook
   * @param {string} sourceText - 업로드할 소스코드
   * @param {string} readmeText - 업로드할 readme
   * @param {string} directory - 업로드할 파일의 경로
   * @param {string} filename - 업로드할 파일명
   * @param {string} commitMessage - 커밋 메시지
   * @param {function} cb - 콜백 함수 (ex. 업로드 후 로딩 아이콘 처리 등)
   */
  
  async function upload(token, hook, sourceText, readmeText, directory, filename, commitMessage, cb) {
  // GitHub 인스턴스를 생성합니다.
  const git = new GitHub(hook, token);
  // 저장소의 통계 정보를 가져옵니다.
  const stats = await getStats();
  // 저장소의 기본 브랜치를 가져옵니다.
  let default_branch = stats.branches[hook];
  // 기본 브랜치가 없을 경우 저장소의 기본 브랜치를 얻어옵니다.
  if (isNull(default_branch)) {
  default_branch = await git.getDefaultBranchOnRepo();
  stats.branches[hook] = default_branch;
  }
  // 브랜치의 SHA 값과 참조를 가져옵니다.
  const { refSHA, ref } = await git.getReference(default_branch);
  // 소스 코드를 Blob으로 생성합니다.
  const source = await git.createBlob(sourceText, ${directory}/${filename});
  // README 파일을 Blob으로 생성합니다.
  const readme = await git.createBlob(readmeText, ${directory}/README.md);
  // 트리의 SHA 값을 생성합니다.
  const treeSHA = await git.createTree(refSHA, [source, readme]);
  // 커밋의 SHA 값을 생성합니다.
  const commitSHA = await git.createCommit(commitMessage, treeSHA, refSHA);
  // HEAD를 업데이트합니다.
  await git.updateHead(ref, commitSHA);
  
  // stats의 값을 갱신
  updateObjectDatafromPath(stats.submission, ${hook}/${source.path}, source.sha);
  updateObjectDatafromPath(stats.submission, ${hook}/${readme.path}, readme.sha);
  // 통계를 저장합니다.
  await saveStats(stats);
  
  // 콜백 함수가 실행
  if (typeof cb === 'function') cb();
  }
  
  
  
  
  
  