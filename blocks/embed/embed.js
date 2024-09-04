const getDefaultEmbed = (url) => `<div style="left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.25%;">
    <iframe src="${url.href}" style="border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;" allowfullscreen=""
      scrolling="no" allow="encrypted-media" title="Content from ${url.hostname}" loading="lazy">
    </iframe></div>`;
const embedYoutube = (url) => {
  const usp = new URLSearchParams(url.search);
  let vid = usp.get('v') ? encodeURIComponent(usp.get('v')) : '';
  const embed = url.pathname;
  if (url.origin.includes('youtu.be')) {
    [, vid] = url.pathname.split('/');
  }
  const embedHTML = `<div style="left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.25%;">
      <iframe src="https://www.youtube.com${vid ? `/embed/${vid}?rel=0&v=${vid}&mute=1` : embed}" 
      style="border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;" 
      allow="autoplay; fullscreen; picture-in-picture; encrypted-media; accelerometer; gyroscope; picture-in-picture" 
      allowfullscreen="" scrolling="no" title="Content from Youtube" loading="lazy" data-muted="1"></iframe>
    </div>`;
  return embedHTML;
};

const loadEmbed = (block, link) => {
  if (block.classList.contains('embed-is-loaded')) {
    return;
  }

  const EMBEDS_CONFIG = [
    {
      match: ['youtube', 'youtu.be'],
      embed: embedYoutube,
    },
  ];

  const config = EMBEDS_CONFIG.find((e) => e.match.some((match) => link.includes(match)));
  const url = new URL(link);

  if (config) {
    block.innerHTML = config.embed(url); 
    block.classList = `block embed embed-${config.match[0]}`;
  } else {
    block.innerHTML = getDefaultEmbed(url);
    block.classList = 'block embed';
  }
  block.classList.add('embed-is-loaded');
};

export default function decorate(block) {
  const link = block.querySelector('a').href;
  block.textContent = '';

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      const iframe = block.querySelector('iframe');
      if (entry.isIntersecting) {
        const src = iframe.src.replace('&mute=1', '&mute=0');
        iframe.src = src.includes('&autoplay=1') ? src : `${src}&autoplay=1`;
        iframe.dataset.muted = "0"; 
      } else {
        const src = iframe.src.replace('&autoplay=1', '').replace('&mute=0', '&mute=1');
        iframe.src = src;
        iframe.dataset.muted = "1"; //
      }
    });
  });

  observer.observe(block);
  loadEmbed(block, link); // Initially load with autoplay disabled
}
