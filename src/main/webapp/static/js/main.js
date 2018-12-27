function mySubmit(flag){
    return flag;
}
$("#searchform").submit(function () {
    var val=$("#search").val();
    if(val==''){
        alert("请输入关键字");
        return mySubmit(false);
    }
})