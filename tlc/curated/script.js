$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});



var cardBenefits = $("#card-benefits-text");
var addBtn = $("#add-card-benefits");
addBtn.on('click', function(){
cardBenefits.append("<li><input type='text' class='form-control'></li>");
});






var expanded = false;

function showCheckboxes() {
  var checkboxes = document.getElementById("checkboxes");

  if (!expanded) {
    checkboxes.style.display = "block";

    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}



var expanded = false;

function outlets() {
  var checkboxes = document.getElementById("checkboxes1");

  if (!expanded) {
    checkboxes.style.display = "block";

    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}



var cerBenefits = $("#selectOutlets");
var addBtn = $("#selected-outlets");
addBtn.on('click', function(){
cerBenefits.append("<div class='row mt-5'> <div class='col-md-8'> <div class='form-group' > <select class='form-control' id='sel1'> <option>1. Complementary Buffet Meal</option> </select> </div></div><div class='col-md-4'> <div class='form-group'> <select class='form-control' id='sel2'> <option>Dining</option> <option>Stay</option> <option>Health</option> </select> </div></div></div><div class='row mt-5'> <div class='col-md-4'> <div class='form-group'> <select class='form-control' id='sel3'> <option>Delhi NCR</option> </select> </div></div><div class='col-md-4'> <div> <div class='multiselect'> <div class='selectBox' onclick='showCheckboxes()'> <select class='form-control'> <option>Property</option> </select> <div class='overSelect'></div></div><div id='checkboxes'> <label for='four' class='containers'> <input type='checkbox' checked='checked' id='four'/>JW Marriott New Delhi Aerocity <span class='checkmark'></span> </label> <label for='five' class='containers'> <input type='checkbox' checked='checked' id='five'/>The Westin Gurgaon New Delhi <span class='checkmark'></span> </label> <label for='six' class='containers'> <input type='checkbox' id='six'/>Le Meridien Gurgaon Delhi NCR <span class='checkmark'></span> </label> </div></div></div></div><div class='col-md-4'> <div> <div class='multiselect'> <div class='selectBox' onclick='outlets()'> <select class='form-control'> <option>Outlets</option> </select> <div class='overSelect'></div></div><div id='checkboxes1' style='display: none;'> <label for='seven' class='containers'> <input type='checkbox' checked='checked' id='seven'/>K3 <span class='checkmark'></span> </label> <label for='eight' class='containers'> <input type='checkbox' checked='checked' id='eight'/>Delhi Baking Company <span class='checkmark'></span> </label> <label for='nine' class='containers'> <input type='checkbox' id='nine'/>JW Lounge <span class='checkmark'></span> </label> <label for='ten' class='containers'> <input type='checkbox' id='ten'/>Seasonal Tastes <span class='checkmark'></span> </label> </div></div></div></div></div><div class='row'> <div class='col-md-12'> <div class='form-group' id='selectOutlets'> <label for='comment'>Selected Outlets</label> <textarea class='form-control' rows='5' id='comment'>");
});
 




  
// $(document).ready(function(){
 
//  var checkboxes = $("#checkboxes1  input[type='checkbox']");
//   checkboxes.on('click', function() {



//   $('#remark').append('<span class="dynamic-box">'+checkboxes.filter(':checked').map(function(item) {
//             return this.value;
//         }).get()+' </span>');

//           $('.dynamic-box').click(function(){
//            $('.dynamic-box').hide();
//         });

// });



// });



function Chip(label) {
    this.checkedItems = [];
    this.label = label;
    this.displayarea = document.getElementById("display");
    this.checkbox = document.getElementsByClassName("chkbox-container");  
}

Chip.prototype.display = function () {
    a.displayarea.innerHTML = "";
    for (let i in a.checkedItems) {
        a.displayarea.insertAdjacentHTML("beforeend",
            `<div class="chip">
            <label>${a.checkedItems[i].parentElement.innerText}</label>
            <span class="closebtn" name="${a.checkedItems[i].parentElement.innerText}">x</span>
        </div>`
        );
        document.getElementsByClassName("closebtn")[i].addEventListener("click",a.unchecked);
    } 
}

Chip.prototype.checkfn = function () {
    a.checkedItems = [];
    var inputs = document.querySelectorAll(".chkbox-container input");
    for (let i in inputs) {
        if (inputs[i].checked)
            a.checkedItems.push(inputs[i]);
           
    }
    a.display();    
}

Chip.prototype.unchecked = function (e) {
    var ele = e.target.getAttribute("name");
    for(let i in a.checkedItems){
        a.checkedItems[i].parentElement.innerText == ele ? a.checkedItems[i].checked = false : a.checkedItems[i].checked = true; 
    }    
    a.checkfn();
}

Chip.prototype.addevent = function(){
   var chkinp = document.querySelectorAll(".chkbox-container input");
    for(let i=0; i<=chkinp.length-1; i++){
        chkinp[i].addEventListener("click",a.checkfn);
    }
}

var a = new Chip;
a.checkfn();
a.addevent();