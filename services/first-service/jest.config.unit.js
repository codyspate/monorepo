const rootConfig = require('./jest.config');
rootConfig.testRegex = `(__tests__(.*)?(\\.)(test|spec))\\.(ts|js)x?$`;
console.log('RUNNING UNIT TESTS');
module.exports = rootConfig;
