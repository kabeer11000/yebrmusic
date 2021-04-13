// Added this because i wanted property?.something so i did it using babel
const {useBabelRc, override} = require('customize-cra');
module.exports = override(useBabelRc());
