document.addEventListener("DOMContentLoaded", function() {
    // active page
    var addr = location.pathname;
    document.querySelector('a[href="' + addr + '"]').parentNode.classList.add('active');
    // page height
    var w = window;
    var d = document;
    var e = d.documentElement;
    var g = d.getElementsByTagName('body')[0];
    var height = w.innerHeight|| e.clientHeight|| g.clientHeight;
    document.getElementsByClassName('wrapper_content')[0].style.minHeight = (height - 148) + 'px';
});