// ===== NAVIGATION SCROLL EFFECT =====
const nav = document.getElementById('nav');
const hamburger = document.getElementById('hamburger');
const mobileMenu = document.getElementById('mobileMenu');

window.addEventListener('scroll', () => {
  if (window.scrollY > 40) {
    nav.classList.add('scrolled');
  } else {
    nav.classList.remove('scrolled');
  }
});

hamburger.addEventListener('click', () => {
  mobileMenu.classList.toggle('open');
});

// Close mobile menu on link click
document.querySelectorAll('.mobile-link').forEach(link => {
  link.addEventListener('click', () => {
    mobileMenu.classList.remove('open');
  });
});

// ===== SCROLL ANIMATIONS =====
const fadeEls = document.querySelectorAll(
  '.service-card, .about__feature, .testimonial-card, .pricing-card, .area-chip, .trust-item, .gallery__item'
);

fadeEls.forEach(el => el.classList.add('fade-in'));

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
}, { threshold: 0.12, rootMargin: '0px 0px -40px 0px' });

fadeEls.forEach(el => observer.observe(el));

// ===== QUOTE FORM HANDLER =====
const form = document.getElementById('quoteForm');
const formSuccess = document.getElementById('formSuccess');

form.addEventListener('submit', (e) => {
  e.preventDefault();

  // Collect form data
  const data = Object.fromEntries(new FormData(form));
  console.log('Quote request:', data);

  // In production, send to a backend / Formspree / Netlify Forms / etc.
  // e.g.: fetch('/api/quote', { method: 'POST', body: JSON.stringify(data) })

  // Show success state
  form.style.display = 'none';
  formSuccess.style.display = 'flex';

  // Scroll to success
  formSuccess.scrollIntoView({ behavior: 'smooth', block: 'center' });
});

// ===== SMOOTH SCROLL OFFSET FOR FIXED NAV =====
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', (e) => {
    const target = document.querySelector(anchor.getAttribute('href'));
    if (target) {
      e.preventDefault();
      const offset = 80; // nav height
      const top = target.getBoundingClientRect().top + window.scrollY - offset;
      window.scrollTo({ top, behavior: 'smooth' });
    }
  });
});

// ===== VIDEO LAZY LOAD / FALLBACK =====
// If videos haven't loaded (e.g. still generating), show poster gracefully
document.querySelectorAll('video').forEach(video => {
  video.addEventListener('error', () => {
    video.style.display = 'none';
  });
});

// ===== PARALLAX HERO HINT =====
// Subtle parallax on hero content
const heroContent = document.querySelector('.hero__content');
if (heroContent) {
  window.addEventListener('scroll', () => {
    const scrolled = window.scrollY;
    if (scrolled < window.innerHeight) {
      heroContent.style.transform = `translateY(${scrolled * 0.2}px)`;
      heroContent.style.opacity = 1 - (scrolled / window.innerHeight) * 1.5;
    }
  }, { passive: true });
}
