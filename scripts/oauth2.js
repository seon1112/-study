// eslint-disable-next-line no-unused-vars
const oAuth2 = {
  // 팝업에 필요한 js
  /**
   * Initialize
   */
  init() {
    this.KEY = 'BaekjoonHub_token'; // PodoFarm_token
    this.ACCESS_TOKEN_URL = 'https://github.com/login/oauth/access_token';
    this.AUTHORIZATION_URL = 'https://github.com/login/oauth/authorize';
    this.CLIENT_ID = '975f8d5cf6686dd1faed';
    this.CLIENT_SECRET = '934b2bfc3bb3ad239bc67bdfa81a378b1616dd1e';
    this.REDIRECT_URL = 'https://github.com/'; // for example, https://github.com
    this.SCOPES = ['repo'];
  },
  // init() {
  //   this.KEY = 'PodoFarm_token';
  //   this.CLIENT_ID = 'YOUR_GOOGLE_CLIENT_ID';
  //   this.REDIRECT_URL = `chrome-extension://${chrome.runtime.id}/main_page.html`;
  //   this.SCOPES = ['profile', 'email'];
  // }
  begin() {
    this.init(); // secure token params.

    let url = `${this.AUTHORIZATION_URL}?client_id=${this.CLIENT_ID}&redirect_uri${this.REDIRECT_URL}&scope=`;

    for (let i = 0; i < this.SCOPES.length; i += 1) {
      url += this.SCOPES[i];
    }

    chrome.storage.local.set({ pipe_podofarm: true }, () => {
      // opening pipe temporarily

      chrome.tabs.create({ url, selected: true }, function () {
        window.close();
        chrome.tabs.getCurrent(function (tab) {});
      });
    });
  },
};
