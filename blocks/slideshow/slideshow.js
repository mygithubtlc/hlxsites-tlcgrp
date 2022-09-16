function scrollToStart(block) {
  if (block.scrollLeft !== 0) {
    block.scrollLeft = 0;
    const leftNav = block.querySelector('.slideshow-nav-left');
    leftNav.classList.add('slideshow-nav-disabled');
    const rightNav = block.querySelector('.slideshow-nav-right');
    rightNav.classList.remove('slideshow-nav-disabled');
  }
}

function checkScrollPosition(el) {
  if (el.scrollLeft === 0) return 'start';
  if (el.scrollWidth - el.scrollLeft === el.offsetWidth) return 'end';
  return null;
}

function buildNav(dir) {
  const btn = document.createElement('aside');
  btn.classList.add('slideshow-nav', `slideshow-nav-${dir}`);
  if (dir === 'left') btn.classList.add('slideshow-nav-disabled'); // start at beginning, can't scroll left
  btn.innerHTML = `<img class="icon icon-angle-${dir}-white" src="/icons/angle-${dir}-white.svg" alt=""/>`;
  btn.addEventListener('click', (e) => {
    const target = e.target.closest('.slideshow-nav');
    if (![...target.classList].includes('slideshow-nav-disabled')) {
      const carousel = e.target.closest('.slideshow');
      carousel.querySelectorAll('.slideshow-nav').forEach((nav) => nav.classList.remove('slideshow-nav-disabled'));
      if (dir === 'left') {
        carousel.scrollLeft -= carousel.offsetWidth;
      } else {
        carousel.scrollLeft += carousel.offsetWidth;
      }
      setTimeout(() => {
        const position = checkScrollPosition(carousel);
        if ((position === 'start' && dir === 'left')
          || (position === 'end' && dir === 'right')) {
          btn.classList.add('slideshow-nav-disabled');
        } else {
          btn.classList.remove('slideshow-nav-disabled');
        }
      }, 750);
    }
  });
  return btn;
}

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
    const leftBtn = buildNav('left');
    const rightBtn = buildNav('right');
    block.prepend(leftBtn, rightBtn);
    window.addEventListener('resize', () => {
      scrollToStart(block);
    });
  }
}
