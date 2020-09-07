// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

//const channels = require.context('.', true, /_channel\.js$/)
//channels.keys().forEach(channels)

function price(){
   const priceInput = document.getElementById("item-price");//販売価格
   const add_tax = document.getElementById("add-tax-price");//販売手数料
   const profit = document.getElementById("profit");//販売利益
   
     priceInput.addEventListener('keyup', () => {
         const value = priceInput.value; 
         
       if (value >= 300 && value <= 9999999){
         let fee = value * 0.1
         let gains = value - fee
         add_tax.textContent = Math.floor(fee);
         profit.textContent = Math.floor(gains);
     } else {
         let fee = '-';
         let gains = '-';
         add_tax.textContent = fee;
         profit.textContent = gains;
     }
   });
  
  }
  setInterval(price, 1000);