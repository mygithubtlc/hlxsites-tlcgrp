export default async function decorate(block) {
  const slides = [...block.children];
  slides.forEach((slide, index) => {
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
      // hide and reveal heading text after trigger word
      const trigger = 'through';
      overlay.querySelectorAll('h1,h2').forEach((heading) => {
        const text = heading.textContent;
        const pos = text.includes(trigger)
          ? (text.indexOf(trigger) + trigger.length + 1)
          : 0;
        if (pos) {
          const revealText = text.substring(pos + trigger.length + 1);
          heading.innerHTML = `${text.substring(0, pos)}<br>
            <span class="${index ? '' : 'slideshow-reveal'}">${revealText}</span>`;
        }
      });
    }
  });

  // setup for multiple slides
  if (slides.length > 1) {
    let index = 0;
    setInterval(() => {
      // remove animation from all spans
      block.querySelectorAll('span').forEach((span) => {
        span.classList.remove('slideshow-reveal');
      });
      if (block.scrollWidth - block.scrollLeft > block.offsetWidth) {
        // next slide
        index += 1;
        block.scrollLeft += block.offsetWidth;
      } else {
        // back to start
        index = 0;
        block.scrollLeft = 0;
      }
      // add animation to next span
      block.children[index].querySelectorAll('span').forEach((span) => {
        span.classList.add('slideshow-reveal');
      });
    }, 7000);
    window.addEventListener('resize', () => {
      block.scrollLeft = 0;
    });
  }
}
