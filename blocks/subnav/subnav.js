// const parentElement = document.querySelector('.subnav');
// const childElements = parentElement.querySelectorAll('p');
// const urls = ['https://tlcgroup.com/memberships-subscriptions', 'https://www.tlcgroup.com/experience-vouchers', 'https://www.tlcgroup.com/online-food-delivery-platform', 'https://www.tlcgroup.com/online-table-reservations-platform'];
// childElements.forEach(function(childElement, index) {
//     let anchorTag = document.createElement('a');
//     anchorTag.href = urls[index] || '#'; 
//     anchorTag.classList.add('custom-class');
//     childElement.parentNode.insertBefore(anchorTag, childElement);
//     anchorTag.appendChild(childElement);
// });
// // Hover changes start 
// const customElements = document.querySelectorAll('.custom-class');
// const newTexts = ['Monetize data through prepaid benefits & experiences. ', ' The right positioning for your products by co-bundling vouchers & more.', 'Scale your gourmet restaurant with our white labelled solution.', 'A platform that provides seamless dining experiences to high value customers.'];
// customElements.forEach((element, index) => {
//     const originalText = element.querySelector('p').innerHTML;
//     element.addEventListener('mouseenter', () => {
//     element.style.backgroundColor = '#676767';
//     element.style.color = '#fff';
//     element.style.fontSize = '16px';
//     element.style.textAlign = 'left';
//     element.style.display = 'flex';
//     element.style.alignItems = 'center';
//     const newText = newTexts[index] || 'Default Text';         
//     element.querySelector('p').innerHTML = newText;
// });

//     element.addEventListener('mouseleave', () => {
//     element.style.backgroundColor = '';
//     element.style.color = '';
//     element.style.fontSize = '';
//     element.style.padding = '';
//     element.style.textAlign = '';
//     element.style.display = '';
//     element.style.alignItems = '';

//     element.querySelector('p').innerHTML = originalText;
//     });
// });

