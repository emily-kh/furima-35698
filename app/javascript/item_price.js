
function item(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = inputValue * 0.1
    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - addTaxDom.innerHTML
  })
}
window.addEventListener('load', item)
  