// API Docs: http://nightwatchjs.org/api

module.exports = {
  'Test index page of google.com': function(browser) {
    browser
      .url('https://google.com/')
      .waitForElementVisible('body', 1000)
      .resizeWindow(1200, 800);

    // expect element body to be present in 1000ms
    browser.expect.element('body').present.before(1000);

    // browser.saveScreenshot('screenshots/google-index-md.png');
    browser.waitForElementVisible('#lga', 1000);
    browser.expect.element('#footer').visible;

    browser.end();
  },
};
