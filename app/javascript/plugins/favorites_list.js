const displayAlertOnHeartClick = () => {
  // TODO: Select the big green button
  const heart = document.querySelector('#heart-icon');
  // TODO: Bind the `click` event to the button
  heart.addEventListener('click', () => {
  // TODO: On click, display `Thank you!` in a JavaScript alert!
    alert('This animal has been added to your list!');
  });
};


export { displayAlertOnHeartClick };
