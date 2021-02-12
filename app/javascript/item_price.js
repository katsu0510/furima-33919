window.addEventListener('load', () => {
   const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log(inputValue);
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML =  Math.floor(inputValue * 0.1);
      const profitNum = document.getElementById("profit");
      profitNum.innerHTML =  Math.floor(inputValue - addTaxDom);
   });
});