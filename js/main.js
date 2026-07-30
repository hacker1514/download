/**
 * K-Drive Website — Main JavaScript
 * Author: Niranjan Kumar K
 *
 * Modular vanilla JS for all interactive features:
 * - Loading screen
 * - Theme toggle
 * - Scroll progress & header
 * - Intersection Observer animations
 * - Ripple effects
 * - Installation tabs
 * - Copy to clipboard
 * - Command search
 * - Animated counters
 * - Skill bars
 * - Mobile navigation
 * - Back to top
 */

(function () {
  'use strict';

  /* =========================================================================
     DOM References
     ========================================================================= */
  const DOM = {
    loader: document.getElementById('loader'),
    scrollProgress: document.getElementById('scrollProgress'),
    header: document.getElementById('header'),
    themeToggle: document.getElementById('themeToggle'),
    navToggle: document.getElementById('navToggle'),
    navMenu: document.getElementById('navMenu'),
    backToTop: document.getElementById('backToTop'),
    toast: document.getElementById('toast'),
    commandSearch: document.getElementById('commandSearch'),
    commandsBody: document.getElementById('commandsBody'),
    commandsEmpty: document.getElementById('commandsEmpty'),
  };

  /* =========================================================================
     Theme Management
     ========================================================================= */
  const Theme = {
    STORAGE_KEY: 'kdrive-theme',

    init() {
      const saved = localStorage.getItem(this.STORAGE_KEY);
      const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
      const theme = saved || (prefersDark ? 'dark' : 'light');
      this.set(theme);

      DOM.themeToggle?.addEventListener('click', () => {
        const current = document.documentElement.getAttribute('data-theme');
        this.set(current === 'dark' ? 'light' : 'dark');
      });
    },

    set(theme) {
      document.documentElement.setAttribute('data-theme', theme);
      localStorage.setItem(this.STORAGE_KEY, theme);
    },
  };

  /* =========================================================================
     Loading Screen
     ========================================================================= */
  const Loader = {
    init() {
      window.addEventListener('load', () => {
        setTimeout(() => {
          DOM.loader?.classList.add('hidden');
          document.body.classList.add('loaded');
        }, 800);
      });
    },
  };

  /* =========================================================================
     Scroll Handlers
     ========================================================================= */
  const Scroll = {
    init() {
      window.addEventListener('scroll', () => this.onScroll(), { passive: true });
      this.onScroll();
    },

    onScroll() {
      const scrollTop = window.scrollY;
      const docHeight = document.documentElement.scrollHeight - window.innerHeight;
      const progress = docHeight > 0 ? (scrollTop / docHeight) * 100 : 0;

      if (DOM.scrollProgress) {
        DOM.scrollProgress.style.width = `${progress}%`;
      }

      DOM.header?.classList.toggle('scrolled', scrollTop > 50);
      DOM.backToTop?.classList.toggle('visible', scrollTop > 400);
    },
  };

  /* =========================================================================
     Mobile Navigation
     ========================================================================= */
  const Navigation = {
    init() {
      DOM.navToggle?.addEventListener('click', () => this.toggle());
      DOM.navMenu?.querySelectorAll('.nav__link').forEach((link) => {
        link.addEventListener('click', () => this.close());
      });
    },

    toggle() {
      const isOpen = DOM.navMenu?.classList.toggle('open');
      DOM.navToggle?.classList.toggle('active', isOpen);
      DOM.navToggle?.setAttribute('aria-expanded', String(isOpen));
    },

    close() {
      DOM.navMenu?.classList.remove('open');
      DOM.navToggle?.classList.remove('active');
      DOM.navToggle?.setAttribute('aria-expanded', 'false');
    },
  };

  /* =========================================================================
     Back to Top
     ========================================================================= */
  const BackToTop = {
    init() {
      DOM.backToTop?.addEventListener('click', () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
      });
    },
  };

  /* =========================================================================
     Intersection Observer — Scroll Reveal Animations
     ========================================================================= */
  const Reveal = {
    init() {
      const elements = document.querySelectorAll('.reveal');
      if (!elements.length) return;

      const observer = new IntersectionObserver(
        (entries) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting) {
              entry.target.classList.add('visible');
              observer.unobserve(entry.target);
            }
          });
        },
        { threshold: 0.1, rootMargin: '0px 0px -40px 0px' }
      );

      elements.forEach((el) => observer.observe(el));
    },
  };

  /* =========================================================================
     Ripple Effect on Buttons
     ========================================================================= */
  const Ripple = {
    init() {
      document.querySelectorAll('.ripple').forEach((el) => {
        el.addEventListener('click', (e) => this.create(e, el));
      });
    },

    create(event, element) {
      const rect = element.getBoundingClientRect();
      const size = Math.max(rect.width, rect.height);
      const ripple = document.createElement('span');
      ripple.classList.add('ripple-effect');
      ripple.style.width = `${size}px`;
      ripple.style.height = `${size}px`;
      ripple.style.left = `${event.clientX - rect.left - size / 2}px`;
      ripple.style.top = `${event.clientY - rect.top - size / 2}px`;
      element.appendChild(ripple);
      ripple.addEventListener('animationend', () => ripple.remove());
    },
  };

  /* =========================================================================
     Installation Tabs
     ========================================================================= */
  const InstallTabs = {
    init() {
      const buttons = document.querySelectorAll('.install-tabs__btn');
      buttons.forEach((btn) => {
        btn.addEventListener('click', () => this.switch(btn));
      });
    },

    switch(activeBtn) {
      const tabId = activeBtn.dataset.tab;

      document.querySelectorAll('.install-tabs__btn').forEach((btn) => {
        const isActive = btn === activeBtn;
        btn.classList.toggle('active', isActive);
        btn.setAttribute('aria-selected', String(isActive));
      });

      document.querySelectorAll('.install-tabs__panel').forEach((panel) => {
        panel.classList.toggle('active', panel.id === `tab-${tabId}`);
      });
    },
  };

  /* =========================================================================
     Copy to Clipboard
     ========================================================================= */
  const Clipboard = {
    init() {
      document.querySelectorAll('[data-copy]').forEach((btn) => {
        btn.addEventListener('click', (e) => {
          e.preventDefault();
          e.stopPropagation();
          this.copy(btn.dataset.copy, btn);
        });
      });
    },

    async copy(text, button) {
      try {
        await navigator.clipboard.writeText(text);
        button.classList.add('copied');
        button.textContent = 'Copied!';
        Toast.show('Copied to clipboard');

        setTimeout(() => {
          button.classList.remove('copied');
          button.textContent = 'Copy';
        }, 2000);
      } catch {
        Toast.show('Failed to copy');
      }
    },
  };

  /* =========================================================================
     Toast Notifications
     ========================================================================= */
  const Toast = {
    timeout: null,

    show(message) {
      if (!DOM.toast) return;
      DOM.toast.textContent = message;
      DOM.toast.classList.add('show');
      clearTimeout(this.timeout);
      this.timeout = setTimeout(() => {
        DOM.toast.classList.remove('show');
      }, 2500);
    },
  };

  /* =========================================================================
     Command Search & Filter
     ========================================================================= */
  const CommandSearch = {
    init() {
      DOM.commandSearch?.addEventListener('input', (e) => {
        this.filter(e.target.value.trim().toLowerCase());
      });
    },

    filter(query) {
      const rows = DOM.commandsBody?.querySelectorAll('tr') || [];
      let visibleCount = 0;

      rows.forEach((row) => {
        const command = row.dataset.command?.toLowerCase() || '';
        const description = row.querySelector('td:nth-child(2)')?.textContent.toLowerCase() || '';
        const match = !query || command.includes(query) || description.includes(query);
        row.classList.toggle('hidden', !match);
        if (match) visibleCount++;
      });

      if (DOM.commandsEmpty) {
        DOM.commandsEmpty.hidden = visibleCount > 0;
      }
    },
  };

  /* =========================================================================
     Animated Counters
     ========================================================================= */
  const Counters = {
    init() {
      const counters = document.querySelectorAll('.stat-card__number[data-target]');
      if (!counters.length) return;

      const observer = new IntersectionObserver(
        (entries) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting) {
              this.animate(entry.target);
              observer.unobserve(entry.target);
            }
          });
        },
        { threshold: 0.5 }
      );

      counters.forEach((counter) => observer.observe(counter));
    },

    animate(element) {
      const target = parseInt(element.dataset.target, 10);
      const suffix = element.dataset.suffix || '';
      const duration = 2000;
      const startTime = performance.now();

      const step = (currentTime) => {
        const elapsed = currentTime - startTime;
        const progress = Math.min(elapsed / duration, 1);
        const eased = 1 - Math.pow(1 - progress, 3);
        const current = Math.floor(eased * target);
        element.textContent = `${current.toLocaleString()}${suffix}`;

        if (progress < 1) {
          requestAnimationFrame(step);
        } else {
          element.textContent = `${target.toLocaleString()}${suffix}`;
        }
      };

      requestAnimationFrame(step);
    },
  };

  /* =========================================================================
     Animated Skill Bars
     ========================================================================= */
  const SkillBars = {
    init() {
      const bars = document.querySelectorAll('.skill-bar[data-level]');
      if (!bars.length) return;

      const observer = new IntersectionObserver(
        (entries) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting) {
              const level = entry.target.dataset.level;
              entry.target.style.setProperty('--level', `${level}%`);
              entry.target.classList.add('animated');
              observer.unobserve(entry.target);
            }
          });
        },
        { threshold: 0.3 }
      );

      bars.forEach((bar) => observer.observe(bar));
    },
  };

  /* =========================================================================
     Active Nav Link Highlighting
     ========================================================================= */
  const ActiveNav = {
    init() {
      const sections = document.querySelectorAll('section[id]');
      const navLinks = document.querySelectorAll('.nav__link');

      if (!sections.length || !navLinks.length) return;

      const observer = new IntersectionObserver(
        (entries) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting) {
              const id = entry.target.getAttribute('id');
              navLinks.forEach((link) => {
                link.classList.toggle(
                  'active',
                  link.getAttribute('href') === `#${id}`
                );
              });
            }
          });
        },
        { threshold: 0.3, rootMargin: '-80px 0px -60% 0px' }
      );

      sections.forEach((section) => observer.observe(section));
    },
  };

  /* =========================================================================
     Initialize All Modules
     ========================================================================= */
  function init() {
    Theme.init();
    Loader.init();
    Scroll.init();
    Navigation.init();
    BackToTop.init();
    Reveal.init();
    Ripple.init();
    InstallTabs.init();
    Clipboard.init();
    CommandSearch.init();
    Counters.init();
    SkillBars.init();
    ActiveNav.init();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
