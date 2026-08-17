// ===== NAVIGATION SCROLL EFFECT =====
const nav = document.getElementById('nav');
const hamburger = document.getElementById('hamburger');
const mobileMenu = document.getElementById('mobileMenu');

window.addEventListener('scroll', () => {
  nav.classList.toggle('scrolled', window.scrollY > 40);
}, { passive: true });

hamburger.addEventListener('click', () => {
  mobileMenu.classList.toggle('open');
});

document.querySelectorAll('.mobile-link').forEach(link => {
  link.addEventListener('click', () => mobileMenu.classList.remove('open'));
});

// ===== VIDEO LOADER =====
// Force-loads every video element. Works around browsers that won't autoplay
// until the user scrolls to the element, and recovers from transient errors.
function initVideos() {
  document.querySelectorAll('video').forEach(video => {
    // Always muted + playsInline so autoplay policy allows it
    video.muted = true;
    video.playsInline = true;
    video.setAttribute('playsinline', '');

    // Retry on error (handles CF Pages cold-start / range-request hiccup)
    let retries = 0;
    video.addEventListener('error', () => {
      if (retries < 3) {
        retries++;
        setTimeout(() => {
          const src = video.currentSrc || video.querySelector('source')?.src;
          if (src) {
            video.load();
            video.play().catch(() => {});
          }
        }, retries * 1500);
      }
    });

    // Kick off load + play immediately
    video.load();
    video.play().catch(() => {
      // Autoplay blocked — video will play on first user interaction
    });
  });
}

// ===== INTERSECTION OBSERVER — play/pause off-screen =====
// Keeps videos muted+playing when visible, paused when off-screen (saves CPU)
function observeVideos() {
  if (!('IntersectionObserver' in window)) return;
  const io = new IntersectionObserver((entries) => {
    entries.forEach(({ target, isIntersecting }) => {
      if (isIntersecting) {
        target.play().catch(() => {});
      } else {
        target.pause();
      }
    });
  }, { threshold: 0.1 });

  document.querySelectorAll('video').forEach(v => io.observe(v));
}

// ===== SCROLL ANIMATIONS =====
const fadeEls = document.querySelectorAll(
  '.service-card, .about__feature, .testimonial-card, .pricing-card, .area-chip, .trust-item, .gallery__item'
);
fadeEls.forEach(el => el.classList.add('fade-in'));

const fadeObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) entry.target.classList.add('visible');
  });
}, { threshold: 0.12, rootMargin: '0px 0px -40px 0px' });

fadeEls.forEach(el => fadeObserver.observe(el));

// ===== QUOTE FORM =====
const form = document.getElementById('quoteForm');
const formSuccess = document.getElementById('formSuccess');

// Standard POST to FormSubmit (redirects back with ?sent=1).
// Show success state when returning from a successful send.
if (new URLSearchParams(window.location.search).get('sent') === '1') {
  form.style.display = 'none';
  formSuccess.style.display = 'flex';
  setTimeout(() => formSuccess.scrollIntoView({ behavior: 'smooth', block: 'center' }), 300);
}
form.addEventListener('submit', () => {
  const btn = document.getElementById('submitBtn');
  btn.disabled = true;
  btn.textContent = 'Sending…';
});

// ===== SMOOTH SCROLL OFFSET =====
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', (e) => {
    const target = document.querySelector(anchor.getAttribute('href'));
    if (target) {
      e.preventDefault();
      const top = target.getBoundingClientRect().top + window.scrollY - 80;
      window.scrollTo({ top, behavior: 'smooth' });
    }
  });
});

// ===== PARALLAX HERO =====
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

// ===== INIT =====
// Delay slightly so the DOM is fully painted before we poke video elements
window.addEventListener('DOMContentLoaded', () => {
  initVideos();
  observeVideos();
});
