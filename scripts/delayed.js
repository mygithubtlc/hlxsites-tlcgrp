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

window.targetGlobalSettings = {
  bodyHidingEnabled: false,
};

// google tag manager
const gtmId = 'GTM-58VC5NG';
// eslint-disable-next-line
(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start': new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0], j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src= 'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f); })(window,document,'script','dataLayer',gtmId);

// google analytics
const gaId = 'G-ZE1NRYD0CR';
loadScript(`https://www.googletagmanager.com/gtag/js?id=${gaId}`, 'async', () => {
  // eslint-disable-next-line
  window.dataLayer = window.dataLayer || []; function gtag(){dataLayer.push(arguments);} gtag('js', new Date()); gtag('config', gaId);
});

// adobe launch
const isProd = window.location.hostname.endsWith('tlcgroup.com');
const launchUrl = isProd
  ? 'https://assets.adobedtm.com/0b11157d649c/ea4457f87a55/launch-8ce7ba668a1c.min.js'
  : 'https://assets.adobedtm.com/0b11157d649c/ea4457f87a55/launch-52fa4168ab4d-staging.min.js';
loadScript(launchUrl);

const cookId = 'cookiesId';
loadScript(`https://cdn-cookieyes.com/client_data/e9c7bcf16e0e144a5a75e71c/script.js?id=${cookId}`);

const iframe = document.createElement("iframe");

// Set the attributes for the iframe
iframe.id = 'Iframe1';
iframe.className = 'dunsLogo';
iframe.src = 'https://dunsregistered.dnb.com/SealAuthentication.aspx?Cid=1';
iframe.width = '114px';
iframe.height = '97px';
iframe.frameBorder = '0';
iframe.scrolling = 'no';
iframe.allowTransparency = 'true';

// Append the iframe element to the body
document.body.appendChild(iframe);

let lastScrollTop = 0;

// Add scroll event listener

window.addEventListener('scroll', function() {
const st = window.pageYOffset || document.documentElement.scrollTop;
  // Check if scrolling down
  if (st > lastScrollTop) {
    iframe.style.display = 'block'; // or 'inline' or 'your_preferred_display_value'
  } else {
    // Scrolling up
    iframe.style.display = 'none';
  }

  lastScrollTop = st;
});
loadScript('https://dunsregistered.dnb.com/');

loadScript('<link rel="canonical" href="https://tlcgroup.com/" />');
