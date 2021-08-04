// Added this because i wanted property?.something so i did it using babel
import {addWebpackAlias} from "customize-cra";

const {useBabelRc, override} = require('customize-cra');
module.exports = override(useBabelRc(), addWebpackAlias({
    'react': 'preact/compat',
    'react-dom': 'preact/compat'
}));

