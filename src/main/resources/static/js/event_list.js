$(document).ready(function(){

function go(page){
   //const limit = $('#viewcount').val();
   const limit = 10;
   const state = "ajax";
   const data ={limit:limit, state:state, page:page};
   ajax(data);
   
} //go(page) end


})//ready end