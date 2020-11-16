import '@stripe/stripe-js';

const button = document.getElementById("stripe")
const id = location.pathname.split("/")[2]
button.addEventListener("click", (e) => {
  fetch(`/payments?id=${id}`, {
    method: "POST",
    headers: {
      'Content-Type': 'application/json'
    }
  })
  .then((res) => {
    return res.json()
  })
  .then((data) => {
    const stripe = Stripe("pk_test_51Ho5dVFmgeBEAT7KoH3k5qPewwkvipHdsNdjJB9ekThFbMCvj25FEi5ZX7xhMjNzGmF4OSUQL2MPFoklKV3DE6TT00tbGcIBFh");
    stripe.redirectToCheckout({
      sessionId: data.id
    })
  })
  .catch((err) => {
    console.log(err.message)
  })
})