const displayAlertOnHeartClick = () => {
  const heartsArray = document.querySelectorAll('.heart-icon');

  heartsArray.forEach(function(heart) {
    heart.addEventListener('click', (event) => {
      event.preventDefault()

      if (event.target.classList.contains('fas')) {
        $.ajax({
          method: 'DELETE',
          url: "/animals/" + event.target.id  + "/favorites",
          context: document.body
        }).done(function() {
          event.target.classList.remove("fas");
          event.target.classList.add("far");
        });
      } else {
        $.ajax({
          method: 'POST',
          url: "/animals/" + event.target.id  + "/favorites",
          context: document.body
        }).done(function() {
          event.target.classList.remove("far");
          event.target.classList.add("fas");
        });
      }
    });
  });

};
export { displayAlertOnHeartClick };
