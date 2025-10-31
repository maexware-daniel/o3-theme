// ─────────────────────────────────────────────
// BOOTSTRAP – Einzeln importierte Komponenten
// ─────────────────────────────────────────────
//import Alert from 'bootstrap/js/dist/alert';
//import Button from 'bootstrap/js/dist/button';
//import Carousel from 'bootstrap/js/dist/carousel';
import Collapse from 'bootstrap/js/dist/collapse';
import Dropdown from 'bootstrap/js/dist/dropdown';
import Modal from 'bootstrap/js/dist/modal';
import Offcanvas from 'bootstrap/js/dist/offcanvas';
import Popover from 'bootstrap/js/dist/popover';
//import ScrollSpy from 'bootstrap/js/dist/scrollspy';
import Tab from 'bootstrap/js/dist/tab';
//import Toast from 'bootstrap/js/dist/toast';
import Tooltip from 'bootstrap/js/dist/tooltip';

// Optional: global verfügbar machen
window.bootstrap = {
    //Alert,
    //Button,
    //Carousel,
    Collapse,
    Dropdown,
    Modal,
    Offcanvas,
    Popover,
    //ScrollSpy,
    Tab,
    //Toast,
    Tooltip
};

// ─────────────────────────────────────────────
// SPLIDE IMPORT
// ─────────────────────────────────────────────
import Splide from '@splidejs/splide';

// Optional: global verfügbar machen
window.Splide = Splide;

// ─────────────────────────────────────────────
// THEME-JS
// ─────────────────────────────────────────────
import './backdrop.js';
import './hide-alert-basket.js';
import './offcanvas-mainnav.js';
import './productslider.js';
import './remove-from-basket.js';
import './tobasket.js';

// ─────────────────────────────────────────────
// MODUL-JS
// ─────────────────────────────────────────────
//import '../../../../../modules/Vendor/Modul/out/js/modulfunktion.js';
