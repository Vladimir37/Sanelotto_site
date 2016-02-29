document.addEventListener("DOMContentLoaded", function() {
    var addr = location.pathname;
    document.querySelector('a[href="' + addr + '"] nav').classList.add('active_nav');
});