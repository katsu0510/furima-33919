window.addEventListener('load', () => {
   console.log(123)
   const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML =  Math.floor(inputValue * 0.1);
      console.log()
      const profitNum = document.getElementById("profit");
      profitNum.innerHTML =  Math.floor(inputValue * 0.9);
      console.log(inputValue);
   })

});