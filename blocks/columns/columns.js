export default function decorate(block) {
  const cols = [...block.firstElementChild.children];
  block.classList.add(`columns-${cols.length}-cols`);
  [...block.children].forEach((row) => {
    [...row.children].forEach((cell) => {
      const imgs = cell.querySelectorAll('img');
      if (imgs.length > 1) {
        cell.classList.add('image-set');
      }
    });
  });
}
