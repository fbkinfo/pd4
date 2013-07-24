$(function(){
  $("#name").focus();
  $("#btn-print").click(function(e) {
    e.preventDefault();
    window.print();
  });
});