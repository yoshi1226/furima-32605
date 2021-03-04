window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return null;
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue*0.1);
    const addTaxDom1 = document.getElementById("profit")
    addTaxDom1.innerHTML = Math.floor(inputValue*0.9);
  })
})