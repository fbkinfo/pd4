$(function(){
  $("#name").focus();
  $("#btn-print").click(function(e) {
    e.preventDefault();
    window.print();
  });
  $("#pd4_form").submit(function() {
    filled = 
      $("#name").val()    &&
      $("#bdate").val()   &&
      $("#passp").val()   &&
      $("#address").val() &&
      $("#citizen").val() &&
      $("#amount").val();
      if(!filled) {
          alert("Заполните, пожалуйста, все поля.");
          return false;
      } else
        return true;
  });
});