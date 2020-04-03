function checkLogin(user) {
    if (user == "null") {
        // alert("loginFalse")
        $("#loginFalse").show();
        $("#loginTrue").hide();
    } else {
        // alert("loginTrue")
        $("#loginTrue").show();
        $("#loginFalse").hide();
    }
}