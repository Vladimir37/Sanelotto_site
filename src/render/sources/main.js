document.addEventListener("DOMContentLoaded", function() {
    var addr = location.pathname;
    document.querySelector('a[href="' + addr + '"]').parentNode.classList.add('active');
});