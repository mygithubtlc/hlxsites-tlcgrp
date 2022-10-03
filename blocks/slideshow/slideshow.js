export default async function decorate(block) {
  const slides = [...block.children];
  slides.forEach((slide) => {
    const overlay = document.createElement('div');
    overlay.classList.add('slideshow-overlay');
    [...slide.firstElementChild.children].forEach((child) => {
      if (child.nodeName !== 'PICTURE' && !child.querySelector('picture')) {
        overlay.append(child);
        if (child.querySelector('a')) {
          const a = child.querySelector('a');
          if (a.textContent === child.textContent) {
            a.classList.add('btn', 'slideshow-btn');
            child.classList.add('slideshow-btn-wrapper');
          }
        }
      } else if (child.querySelector('picture')) {
        child.outerHTML = child.outerHTML.replace('<p>', '').replace('</p>', '');
        slide.firstElementChild.classList.add('slideshow-img');
      }
      slide.classList.add('slideshow-slide');
    });
    if (overlay.children) {
      slide.append(overlay);
    }
  });

  // setup for multiple slides
  if (slides.length > 1) {
    setInterval(() => {
      if (block.scrollWidth - block.scrollLeft > block.offsetWidth) {
        // next slide
        block.scrollLeft += block.offsetWidth;
      } else {
        // back to start
        block.scrollLeft = 0;
      }
    }, 7000);
    window.addEventListener('resize', () => {
      block.scrollLeft = 0;
    });
  }
}
