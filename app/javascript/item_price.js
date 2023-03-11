window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const taxValue = inputValue/10;
    addTaxDom.innerHTML = Math.floor(taxValue);
    const addProfitDom = document.getElementById("profit");
    const profitValue = inputValue - taxValue;
    addProfitDom.innerHTML = Math.floor(profitValue);

  })


});