const todayQuote = document.getElementById('today');

const displayQuote = () => {
  const dailyQuote = document.querySelectorAll("[data-daily]");
  dailyQuote.forEach((quote) => {
    console.log(quote.style.display)
    quote.style.display = 'revert';
  });
  todayQuote.style.display = 'none';
};

const getTodayQuote = () => {
  todayQuote.addEventListener('click', displayQuote);
};


export { getTodayQuote }
