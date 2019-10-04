const setPricing = (event) => {

    var therapyStartDate = document.querySelector('#therapy_start_on')
    var therapyEndDate = document.querySelector('#therapy_end_on')
    var therapyPrice = document.querySelector('#therapy_therapy_price').value
    var totalPrice = document.querySelector('.therapy-total-price')

    if (therapyStartDate.value && therapyEndDate.value !== '') {

      // Turn inputs into dates
      const startDate = new Date(therapyStartDate.value);
      const endDate = new Date(therapyEndDate.value);

      const seconds = (endDate.getTime() - startDate.getTime()) / 1000
      const days = Math.floor(seconds / (3600*24));

      totalPrice.innerText = `Total: $${days * therapyPrice}`

    } else {
      console.log('Both fields need to be filled in!');
    }
}

export { setPricing };