// eslint-disable-next-line import/no-cycle
import { sampleRUM } from './scripts.js';

// Core Web Vitals RUM collection
sampleRUM('cwv');

// add more delayed functionality here
function loadScript(url, type, callback) {
  const head = document.querySelector('head');
  let script = head.querySelector(`script[src="${url}"]`);
  if (!script) {
    script = document.createElement('script');
    script.src = url;
    if (type) script.setAttribute('type', type);
    head.append(script);
    script.onload = callback;
    return script;
  }
  return script;
}
// google tag manager
const gtmId = 'UA-97477922-3';
window.dataLayer = window.dataLayer || [];
function gtag(key, value) {
  window.dataLayer.push(key, value);
}
gtag('js', new Date());
gtag('config', gtmId);

loadScript(`https://www.googletagmanager.com/gtag/js?id=${gtmId}`, 'async');

// adobe launch
const isProd = window.location.hostname.endsWith('tlcgroup.com');
const launchUrl = isProd
  ? 'https://assets.adobedtm.com/0b11157d649c/ea4457f87a55/launch-8ce7ba668a1c.min.js'
  : 'https://assets.adobedtm.com/0b11157d649c/ea4457f87a55/launch-52fa4168ab4d-staging.min.js';
loadScript(launchUrl);
