$(document).ready(function(){
  $("select#bookmark_category_id").change(function(){
    var id_value_string = $(this).val();
    if (id_value_string == "") { 
        $("select#bookmark_subcategory_id option").remove();
        var row = "<option value=\"" + "" + "\">" + "" + "</option>";
        $(row).appendTo("select#bookmark_subcategory_id");
    }else {
        alert(id_value_string);
        $.ajax({
            dataType: "json",
            url:"update_subcategories/"+id_value_string,        
            error: function(XMLHttpRequest, errorTextStatus, error){
                alert("Failed to submit : "+ erorTextStatus+" ;"+error);
            },
            success: function(data){                    
                $("select#bookmark_subcategory_id option").remove();
                var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                alert(data);
                $(row).appendTo("select#bookmark_subcategory_id"); 
                $.each(data, function(i, j){
                    row = "<option value=\"" + j.id + "\">" + j.title + "</option>";   
                    $(row).appendTo("select#bookmark_subcategory_id");                     
                });             
            }
        })
    };
  });
});
