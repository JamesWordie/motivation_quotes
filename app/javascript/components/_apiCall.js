const todayQuote = document.getElementById('today');

const callApi = () => {
  const url = "https://type.fit/api/quotes";
  fetch(url).then(response => response.json())
            .then((data) => {
              console.log(data);
            });
};

const getTodayQuote = () => {
  todayQuote.addEventListener('click', () => callApi());
};


export { getTodayQuote }
