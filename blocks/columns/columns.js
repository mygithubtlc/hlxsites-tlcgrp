export default function decorate(block) {
  const cols = [...block.firstElementChild.children];
  block.classList.add(`columns-${cols.length}-cols`);
  [...block.children].forEach((row) => {
    [...row.children].forEach((cell) => {
      if (cell.querySelectorAll("img").length > 1) {
        cell.classList.add("image-set");
      } else {
        cell.classList.add("new-image-set");
      }
    });
  });
}
