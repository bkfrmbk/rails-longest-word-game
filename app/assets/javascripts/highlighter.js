const highlighter = () => {
  window.onload = function() {
    const userInput = document.getElementById('userInput');
    userInput.addEventListener('input', () => {
      let str = userInput.value;
      let matchLetter = document.querySelectorAll(".letter");
      matchLetter.forEach(letter => {
        if (str.charAt(str.length-1).toUpperCase() == letter.innerText) {
          letter.classList.add('highlighter');
          console.log(str.charAt(str.length-1), letter.innerText);
        };
      })
    })
  }

}

