// Animations for Event Management Portal

document.addEventListener('DOMContentLoaded', function () {
    console.log("Modern Theme Animations Loaded 🚀");

    // 1. Add fade-in classes to common APEX regions
    const regions = document.querySelectorAll('.t-Region, .t-Card, .t-Button, .t-Form-fieldContainer');
    regions.forEach((el, index) => {
        el.classList.add('fade-in-up');
        // Add staggered delay for a nicer effect
        el.style.transitionDelay = `${index * 50}ms`;
    });

    // 2. Intersection Observer to trigger animations when elements scroll into view
    const observerOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                observer.unobserve(entry.target); // Only animate once
            }
        });
    }, observerOptions);

    document.querySelectorAll('.fade-in-up').forEach(el => {
        observer.observe(el);
    });

    // 3. Optional: Add a subtle tilt effect to cards
    document.querySelectorAll('.t-Card').forEach(card => {
        card.addEventListener('mousemove', (e) => {
            const rect = card.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;

            // Simple spotlight effect via CSS var, assumes CSS handles it or just simple logging for now
            // card.style.setProperty('--mouse-x', `${x}px`);
            // card.style.setProperty('--mouse-y', `${y}px`);
        });
    });
});
