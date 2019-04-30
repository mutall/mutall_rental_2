window.onload = function() {


    //do the toggle function
    var number = document.getElementsByTagName("no");

    for (var i = 0; i < number.length; i++) {
        number[i].onclick = function() {
            var content = this.nextElementSibling;

            if (content.style.display === 'block') {
                content.style.display = 'none';
            } else {
                content.style.display = 'block';
            }
        }
    }
}

function toggleNav() {
    document.getElementById("myNav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("myNav").style.width = "10px";
    document.getElementById("main").style.marginLeft = "0";
}