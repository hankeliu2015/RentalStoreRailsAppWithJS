$(function(){
  $("input.toggle").on("change", function(){
    console.log('worked');
    $(this).siblings("form").trigger("submit")
  })
});

$(function(){
  $("input.toggle").on("change", function(){
    console.log('worked');
    $(this).parents("form").trigger("submit")
  })
});

function test123() {
  console.log("this is the funcion");
}
