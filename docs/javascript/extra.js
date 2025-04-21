document.addEventListener('DOMContentLoaded', function() {
    // Remove footer navigation
    const footerNav = document.querySelector('.nav-footer');
    if (footerNav) {
        footerNav.remove();
    }
    
    // Remove sidebar navigation arrows
    const sidebarArrows = document.querySelectorAll('.bs-sidebar .nav .nav');
    sidebarArrows.forEach(el => el.remove());
});