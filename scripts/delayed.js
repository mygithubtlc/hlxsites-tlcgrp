// eslint-disable-next-line import/no-cycle
import { sampleRUM } from './scripts.js';

// Core Web Vitals RUM collection
sampleRUM('cwv');

// add more delayed functionality here

// google tag manager
const gtmId = 'UA-97477922-3';
window.dataLayer = window.dataLayer || [];
function gtag(key, value) {
  window.dataLayer.push(key, value);
}
gtag('js', new Date());
gtag('config', gtmId);

const script = document.createElement('script');
script.async = true;
script.src = `https://www.googletagmanager.com/gtag/js?id=${gtmId}`;
document.head.append(script);
