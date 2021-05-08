function Calculation () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const value_result = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = value_result;
  const profitDom = document.getElementById("profit");
  profitDom.innerHTML = Math.floor(inputValue - value_result);
  })
}

window.addEventListener('load', Calculation)