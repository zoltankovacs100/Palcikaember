@echo off
echo 🚀 Palcikaember projekt fajlok frissitese...
echo.

REM src/App.css frissitese
echo 📝 src/App.css frissitese...
(
echo /* src/App.css - Fehér háttér + jobb kontraszt */
echo * {
echo   margin: 0;
echo   padding: 0;
echo   box-sizing: border-box;
echo }
echo.
echo :root {
echo   /* Világos téma színek - fehér háttér */
echo   --primary: #01918C;
echo   --primary-light: #02c7c0;
echo   --primary-dark: #017A75;
echo   --secondary: #E5E5E5;
echo   --background: #FFFFFF; /* Fehér háttér */
echo   --surface: #FFFFFF;
echo   --surface-light: #F8F9FA;
echo   --surface-border: #D1D5DB; /* Sötétebb border jobb kontraszthoz */
echo   --surface-hover: #F3F4F6;
echo   --text: #111827; /* Sötétebb szöveg a fehér háttérhez */
echo   --text-secondary: #4B5563; /* Sötétebb másodlagos szöveg */
echo   --text-light: #6B7280;
echo   --success: #01918C;
echo   --danger: #DC2626;
echo   --radius: 12px;
echo   --radius-sm: 8px;
echo   --shadow: 0 2px 8px rgba(0, 0, 0, 0.12^); /* Erősebb árnyék */
echo   --shadow-lg: 0 4px 16px rgba(0, 0, 0, 0.15^);
echo }
echo.
echo body {
echo   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
echo     'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
echo     sans-serif;
echo   -webkit-font-smoothing: antialiased;
echo   -moz-osx-font-smoothing: grayscale;
echo   background: var(--background^);
echo   color: var(--text^);
echo   overflow: hidden;
echo   touch-action: none;
echo   user-select: none;
echo }
echo.
echo .app {
echo   width: 100vw;
echo   height: 100vh;
echo   position: relative;
echo   overflow: hidden;
echo   background: #FFFFFF; /* Tiszta fehér háttér */
echo }
echo.
echo .roles-container {
echo   position: absolute;
echo   top: 0;
echo   left: 0;
echo   width: 100%%;
echo   height: 100%%;
echo   pointer-events: none;
echo   z-index: 10;
echo }
echo.
echo .roles-container ^> * {
echo   pointer-events: auto;
echo }
echo.
echo /* Floating Action Buttons */
echo .fab-container {
echo   position: fixed;
echo   bottom: 24px;
echo   right: 24px;
echo   z-index: 100;
echo }
echo.
echo .color-picker-fab {
echo   position: fixed;
echo   bottom: 24px;
echo   left: 24px;
echo   width: 48px;
echo   height: 48px;
echo   border-radius: 50%%;
echo   border: 2px solid var(--surface-border^);
echo   background: var(--surface^);
echo   display: flex;
echo   align-items: center;
echo   justify-content: center;
echo   box-shadow: var(--shadow-lg^);
echo   cursor: pointer;
echo   z-index: 100;
echo   transition: all 0.2s ease;
echo }
echo.
echo .color-picker-fab:hover {
echo   transform: scale(1.05^);
echo   box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2^);
echo   background: var(--surface-hover^);
echo }
echo.
echo .color-picker-fab:active {
echo   transform: scale(0.95^);
echo }
echo.
echo /* Save Message */
echo .save-message {
echo   position: fixed;
echo   top: 50%%;
echo   left: 50%%;
echo   transform: translate(-50%%, -50%%^);
echo   background: var(--primary^);
echo   color: white;
echo   padding: 16px 32px;
echo   border-radius: var(--radius^);
echo   font-size: 16px;
echo   font-weight: 600;
echo   box-shadow: var(--shadow-lg^);
echo   z-index: 1000;
echo }
echo.
echo /* Mobile optimizations - Footer miatt magasabban */
echo @media (max-width: 768px^) {
echo   .fab-container {
echo     bottom: 50px; /* Footer felett */
echo     right: 16px;
echo   }
echo.
echo   .color-picker-fab {
echo     bottom: 50px; /* Footer felett */
echo     left: 16px;
echo   }
echo }
echo.
echo @media (min-width: 769px^) {
echo   .fab-container {
echo     bottom: 60px; /* Footer felett desktop-on */
echo     right: 24px;
echo   }
echo.
echo   .color-picker-fab {
echo     bottom: 60px; /* Footer felett desktop-on */
echo     left: 24px;
echo   }
echo }
echo.
echo /* PWA styles */
echo @media (display-mode: standalone^) {
echo   .app {
echo     padding-top: env(safe-area-inset-top^);
echo     padding-bottom: env(safe-area-inset-bottom^);
echo     padding-left: env(safe-area-inset-left^);
echo     padding-right: env(safe-area-inset-right^);
echo   }
echo }
echo.
echo /* Smooth scrolling */
echo * {
echo   scroll-behavior: smooth;
echo }
echo.
echo /* Disable pull-to-refresh on mobile */
echo body {
echo   overscroll-behavior-y: contain;
echo }
) > src\App.css

REM src/components/Header.css frissitese
echo 📝 src/components/Header.css frissitese...
(
echo /* src/components/Header.css - Jobb kontraszt fehér háttérhez */
echo .header {
echo   position: fixed;
echo   top: 0;
echo   left: 0;
echo   right: 0;
echo   background: rgba(255, 255, 255, 0.95^);
echo   backdrop-filter: blur(20px^);
echo   border-bottom: 2px solid var(--surface-border^); /* Vastagabb border */
echo   z-index: 50;
echo   padding: 12px 24px;
echo   box-shadow: var(--shadow^);
echo }
echo.
echo .header-content {
echo   max-width: 1200px;
echo   margin: 0 auto;
echo   display: flex;
echo   justify-content: space-between;
echo   align-items: center;
echo   gap: 20px;
echo }
echo.
echo .header-title {
echo   display: flex;
echo   flex-direction: column;
echo   gap: 2px;
echo }
echo.
echo .header-title h1 {
echo   color: var(--text^); /* Sötétebb szöveg */
echo   font-size: 20px;
echo   font-weight: 700;
echo   margin: 0;
echo }
echo.
echo .header-subtitle {
echo   color: var(--text-secondary^); /* Sötétebb másodlagos szöveg */
echo   font-size: 12px;
echo   font-weight: 500;
echo }
echo.
echo .header-actions {
echo   display: flex;
echo   align-items: center;
echo   gap: 12px;
echo }
echo.
echo .header-filename {
echo   display: flex;
echo   align-items: center;
echo   gap: 8px;
echo   background: var(--surface-light^);
echo   padding: 8px 12px;
echo   border-radius: var(--radius^);
echo   border: 2px solid var(--surface-border^); /* Vastagabb border */
echo }
echo.
echo .header-filename svg {
echo   color: var(--text-secondary^);
echo   flex-shrink: 0;
echo }
echo.
echo .filename-input {
echo   background: transparent;
echo   border: none;
echo   color: var(--text^);
echo   font-size: 14px;
echo   outline: none;
echo   width: 120px;
echo   font-weight: 500;
echo }
echo.
echo .filename-input::placeholder {
echo   color: var(--text-light^);
echo }
echo.
echo .save-button {
echo   background: var(--primary^);
echo   color: white;
echo   border: none;
echo   padding: 10px 18px;
echo   border-radius: var(--radius^);
echo   display: flex;
echo   align-items: center;
echo   gap: 6px;
echo   font-weight: 600;
echo   font-size: 14px;
echo   cursor: pointer;
echo   transition: all 0.2s;
echo   box-shadow: var(--shadow^);
echo }
echo.
echo .save-button:hover {
echo   background: var(--primary-dark^);
echo   transform: translateY(-1px^);
echo   box-shadow: var(--shadow-lg^);
echo }
echo.
echo .save-button:active {
echo   transform: translateY(0^);
echo }
echo.
echo @media (max-width: 768px^) {
echo   .header {
echo     padding: 12px 16px;
echo     padding-top: calc(12px + env(safe-area-inset-top^)^);
echo     border-bottom-width: 2px;
echo   }
echo.
echo   .header-content {
echo     flex-wrap: wrap;
echo   }
echo.
echo   .header-title h1 {
echo     font-size: 18px;
echo   }
echo.
echo   .filename-input {
echo     width: 80px;
echo   }
echo.
echo   .save-button {
echo     padding: 8px 14px;
echo     font-size: 13px;
echo   }
echo }
) > src\components\Header.css

REM src/components/RoleCard.css frissitese
echo 📝 src/components/RoleCard.css frissitese...
(
echo /* src/components/RoleCard.css - Jobb kontraszt fehér háttérhez */
echo .role-card {
echo   position: absolute;
echo   background: var(--surface^);
echo   border: 2px solid;
echo   border-radius: var(--radius^);
echo   padding: 12px 16px;
echo   min-width: 120px;
echo   cursor: move;
echo   user-select: none;
echo   display: flex;
echo   align-items: center;
echo   gap: 8px;
echo   transition: all 0.3s ease;
echo   box-shadow: var(--shadow^);
echo   /* Erősebb border alapértelmezetten */
echo   border-color: var(--surface-border^);
echo }
echo.
echo .role-card:hover {
echo   transform: translateY(-2px^);
echo   box-shadow: var(--shadow-lg^);
echo   background: var(--surface-hover^);
echo }
echo.
echo .role-card.selected {
echo   z-index: 100;
echo   box-shadow: 0 0 0 3px rgba(1, 145, 140, 0.3^);
echo   background: var(--surface^);
echo }
echo.
echo .role-card-color-indicator {
echo   width: 4px;
echo   height: 28px;
echo   border-radius: 2px;
echo   flex-shrink: 0;
echo }
echo.
echo .role-card-content {
echo   flex: 1;
echo   display: flex;
echo   align-items: center;
echo   min-width: 0;
echo }
echo.
echo .role-card-text {
echo   color: var(--text^); /* Sötétebb szöveg */
echo   font-size: 14px;
echo   font-weight: 600;
echo   white-space: nowrap;
echo   overflow: hidden;
echo   text-overflow: ellipsis;
echo }
echo.
echo .role-card-input {
echo   background: var(--surface-light^);
echo   border: 2px solid var(--surface-border^); /* Vastagabb border */
echo   color: var(--text^);
echo   padding: 6px 10px;
echo   border-radius: var(--radius-sm^);
echo   font-size: 14px;
echo   font-weight: 600;
echo   width: 100%%;
echo   outline: none;
echo   transition: all 0.2s;
echo }
echo.
echo .role-card-input:focus {
echo   border-color: var(--primary^);
echo   box-shadow: 0 0 0 3px rgba(1, 145, 140, 0.15^);
echo   background: #FFFFFF;
echo }
echo.
echo .role-card-actions {
echo   display: flex;
echo   gap: 4px;
echo   opacity: 0;
echo   transition: opacity 0.2s;
echo }
echo.
echo .role-card:hover .role-card-actions {
echo   opacity: 1;
echo }
echo.
echo .role-card-action {
echo   background: var(--surface-light^);
echo   border: 2px solid var(--surface-border^); /* Vastagabb border */
echo   border-radius: var(--radius-sm^);
echo   width: 28px;
echo   height: 28px;
echo   display: flex;
echo   align-items: center;
echo   justify-content: center;
echo   cursor: pointer;
echo   color: var(--text-secondary^);
echo   transition: all 0.2s;
echo }
echo.
echo .role-card-action:hover {
echo   background: var(--surface-hover^);
echo   color: var(--text^);
echo   transform: scale(1.05^);
echo   border-color: var(--text-light^);
echo }
echo.
echo .role-card-action.delete:hover {
echo   background: var(--danger^);
echo   color: white;
echo   border-color: var(--danger^);
echo }
echo.
echo @media (max-width: 768px^) {
echo   .role-card-actions {
echo     opacity: 1;
echo   }
echo.
echo   .role-card {
echo     padding: 14px 18px;
echo     /* Mobil nézetben erősebb árnyék */
echo     box-shadow: 0 3px 12px rgba(0, 0, 0, 0.15^);
echo   }
echo.
echo   .role-card-action {
echo     width: 32px;
echo     height: 32px;
echo     border-width: 2px;
echo   }
echo.
echo   /* Mobil hover state */
echo   .role-card:active {
echo     transform: scale(0.98^);
echo   }
echo }
) > src\components\RoleCard.css

REM src/components/FloatingActionButton.css frissitese
echo 📝 src/components/FloatingActionButton.css frissitese...
(
echo /* src/components/FloatingActionButton.css - Világos téma */
echo .floating-action-button {
echo   position: fixed;
echo   bottom: 24px;
echo   right: 24px;
echo   width: 56px;
echo   height: 56px;
echo   border-radius: 50%%;
echo   border: none;
echo   background: var(--primary^);
echo   color: white;
echo   display: flex;
echo   align-items: center;
echo   justify-content: center;
echo   box-shadow: var(--shadow-lg^);
echo   cursor: pointer;
echo   z-index: 100;
echo   transition: all 0.2s ease;
echo }
echo.
echo .floating-action-button:hover {
echo   background: var(--primary-dark^);
echo   transform: scale(1.05^) translateY(-2px^);
echo   box-shadow: 0 8px 25px rgba(1, 145, 140, 0.3^);
echo }
echo.
echo .floating-action-button:active {
echo   transform: scale(0.95^);
echo   box-shadow: var(--shadow^);
echo }
echo.
echo @media (max-width: 768px^) {
echo   .floating-action-button {
echo     bottom: 16px;
echo     right: 16px;
echo     width: 52px;
echo     height: 52px;
echo   }
echo }
) > src\components\FloatingActionButton.css

REM src/components/ColorPicker.css frissitese
echo 📝 src/components/ColorPicker.css frissitese...
(
echo /* src/components/ColorPicker.css - Drag ^& Drop stílusokkal */
echo .color-picker {
echo   position: fixed;
echo   bottom: 80px;
echo   left: 24px;
echo   background: var(--surface^);
echo   border: 1px solid var(--surface-border^);
echo   border-radius: var(--radius^);
echo   padding: 20px;
echo   box-shadow: var(--shadow-lg^);
echo   z-index: 200;
echo   width: 280px;
echo   cursor: default; /* Ne legyen move cursor alapértelmezetten */
echo }
echo.
echo .color-picker-header {
echo   display: flex;
echo   justify-content: space-between;
echo   align-items: center;
echo   margin-bottom: 16px;
echo }
echo.
echo .color-picker-title-section {
echo   display: flex;
echo   align-items: center;
echo   gap: 8px;
echo }
echo.
echo .color-picker-drag-handle {
echo   cursor: grab;
echo   color: var(--text-secondary^);
echo   padding: 4px;
echo   border-radius: 4px;
echo   transition: all 0.2s;
echo   display: flex;
echo   align-items: center;
echo   justify-content: center;
echo }
echo.
echo .color-picker-drag-handle:hover {
echo   background: var(--surface-light^);
echo   color: var(--text^);
echo }
echo.
echo .color-picker-drag-handle:active {
echo   cursor: grabbing;
echo   background: var(--surface-border^);
echo }
echo.
echo .color-picker-header h3 {
echo   color: var(--text^);
echo   font-size: 16px;
echo   font-weight: 600;
echo   margin: 0;
echo }
echo.
echo .color-picker-close {
echo   background: var(--surface-light^);
echo   border: 1px solid var(--surface-border^);
echo   color: var(--text-secondary^);
echo   cursor: pointer;
echo   padding: 6px;
echo   display: flex;
echo   align-items: center;
echo   justify-content: center;
echo   border-radius: var(--radius-sm^);
echo   transition: all 0.2s;
echo }
echo.
echo .color-picker-close:hover {
echo   background: var(--surface-border^);
echo   color: var(--text^);
echo }
echo.
echo .color-picker-grid {
echo   display: grid;
echo   grid-template-columns: repeat(6, 1fr^);
echo   gap: 8px;
echo   margin-bottom: 16px;
echo }
echo.
echo .color-option {
echo   width: 36px;
echo   height: 36px;
echo   border-radius: 50%%;
echo   border: 3px solid var(--surface-border^);
echo   cursor: pointer;
echo   position: relative;
echo   transition: all 0.2s;
echo }
echo.
echo .color-option:hover {
echo   transform: scale(1.1^);
echo   box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15^);
echo }
echo.
echo .color-option.selected {
echo   border-color: var(--text^);
echo   box-shadow: 0 0 0 2px var(--surface^), 0 0 0 4px var(--primary^);
echo }
echo.
echo .color-selected-indicator {
echo   color: white;
echo   font-size: 16px;
echo   font-weight: bold;
echo   position: absolute;
echo   top: 50%%;
echo   left: 50%%;
echo   transform: translate(-50%%, -50%%^);
echo   text-shadow: 0 1px 3px rgba(0, 0, 0, 0.8^);
echo }
echo.
echo .color-picker-custom {
echo   display: flex;
echo   align-items: center;
echo   gap: 12px;
echo   padding-top: 12px;
echo   border-top: 1px solid var(--surface-border^);
echo }
echo.
echo .color-picker-custom label {
echo   color: var(--text-secondary^);
echo   font-size: 14px;
echo   font-weight: 500;
echo }
echo.
echo .custom-color-input {
echo   width: 50px;
echo   height: 36px;
echo   border: 2px solid var(--surface-border^);
echo   border-radius: var(--radius-sm^);
echo   background: transparent;
echo   cursor: pointer;
echo   transition: border-color 0.2s;
echo }
echo.
echo .custom-color-input:hover {
echo   border-color: var(--primary^);
echo }
echo.
echo @media (max-width: 768px^) {
echo   .color-picker {
echo     bottom: 70px;
echo     left: 16px;
echo     right: 16px;
echo     width: auto;
echo     max-width: calc(100vw - 32px^);
echo   }
echo.
echo   .color-picker-drag-handle {
echo     padding: 6px;
echo   }
echo.
echo   .color-picker-grid {
echo     grid-template-columns: repeat(4, 1fr^); /* Mobil nézetben 4 oszlop */
echo   }
echo }
) > src\components\ColorPicker.css

REM src/components/BottomSheet.css frissitese
echo 📝 src/components/BottomSheet.css frissitese...
(
echo /* src/components/BottomSheet.css - Világos téma */
echo .bottom-sheet-overlay {
echo   position: fixed;
echo   top: 0;
echo   left: 0;
echo   right: 0;
echo   bottom: 0;
echo   background: rgba(0, 0, 0, 0.4^);
echo   z-index: 300;
echo }
echo.
echo .bottom-sheet {
echo   position: absolute;
echo   bottom: 0;
echo   left: 0;
echo   right: 0;
echo   background: var(--surface^);
echo   border-radius: 24px 24px 0 0;
echo   border-top: 1px solid var(--surface-border^);
echo   padding: 8px 24px 24px;
echo   max-height: 50vh;
echo   overflow-y: auto;
echo   box-shadow: 0 -4px 20px rgba(0, 0, 0, 0.1^);
echo }
echo.
echo .bottom-sheet-handle {
echo   width: 48px;
echo   height: 4px;
echo   background: var(--surface-border^);
echo   border-radius: 2px;
echo   margin: 8px auto 16px;
echo }
echo.
echo .bottom-sheet-header {
echo   display: flex;
echo   justify-content: space-between;
echo   align-items: center;
echo   margin-bottom: 24px;
echo }
echo.
echo .bottom-sheet-header h3 {
echo   color: var(--text^);
echo   font-size: 18px;
echo   font-weight: 600;
echo   margin: 0;
echo }
echo.
echo .bottom-sheet-content {
echo   display: flex;
echo   flex-direction: column;
echo   gap: 20px;
echo }
echo.
echo .bottom-sheet-field {
echo   display: flex;
echo   flex-direction: column;
echo   gap: 8px;
echo }
echo.
echo .bottom-sheet-field label {
echo   color: var(--text-secondary^);
echo   font-size: 14px;
echo   font-weight: 500;
echo }
echo.
echo .bottom-sheet-edit-container {
echo   display: flex;
echo   gap: 8px;
echo }
echo.
echo .bottom-sheet-input {
echo   flex: 1;
echo   background: var(--surface-light^);
echo   border: 1px solid var(--surface-border^);
echo   color: var(--text^);
echo   padding: 10px 12px;
echo   border-radius: var(--radius^);
echo   font-size: 16px;
echo   outline: none;
echo   transition: all 0.2s;
echo }
echo.
echo .bottom-sheet-input:focus {
echo   border-color: var(--primary^);
echo   box-shadow: 0 0 0 3px rgba(1, 145, 140, 0.1^);
echo }
echo.
echo .bottom-sheet-save-btn {
echo   background: var(--primary^);
echo   color: white;
echo   border: none;
echo   padding: 10px 20px;
echo   border-radius: var(--radius^);
echo   font-weight: 600;
echo   cursor: pointer;
echo   transition: all 0.2s;
echo }
echo.
echo .bottom-sheet-save-btn:hover {
echo   background: var(--primary-dark^);
echo }
echo.
echo .bottom-sheet-text-container {
echo   display: flex;
echo   align-items: center;
echo   justify-content: space-between;
echo   background: var(--surface-light^);
echo   padding: 10px 12px;
echo   border-radius: var(--radius^);
echo   border: 1px solid var(--surface-border^);
echo }
echo.
echo .bottom-sheet-text {
echo   color: var(--text^);
echo   font-size: 16px;
echo }
echo.
echo .bottom-sheet-edit-btn {
echo   background: transparent;
echo   border: none;
echo   color: var(--text-secondary^);
echo   cursor: pointer;
echo   padding: 6px;
echo   display: flex;
echo   align-items: center;
echo   justify-content: center;
echo   border-radius: var(--radius-sm^);
echo   transition: all 0.2s;
echo }
echo.
echo .bottom-sheet-edit-btn:hover {
echo   background: var(--surface-border^);
echo   color: var(--text^);
echo }
echo.
echo .bottom-sheet-actions {
echo   margin-top: 12px;
echo   display: flex;
echo   gap: 12px;
echo }
echo.
echo .bottom-sheet-action-btn {
echo   flex: 1;
echo   background: var(--surface-light^);
echo   color: var(--text^);
echo   border: 1px solid var(--surface-border^);
echo   padding: 12px 20px;
echo   border-radius: var(--radius^);
echo   font-weight: 600;
echo   cursor: pointer;
echo   display: flex;
echo   align-items: center;
echo   justify-content: center;
echo   gap: 8px;
echo   transition: all 0.2s;
echo }
echo.
echo .bottom-sheet-action-btn:hover {
echo   background: var(--surface-border^);
echo }
echo.
echo .bottom-sheet-action-btn.delete {
echo   background: rgba(220, 38, 38, 0.1^);
echo   color: var(--danger^);
echo   border-color: rgba(220, 38, 38, 0.2^);
echo }
echo.
echo .bottom-sheet-action-btn.delete:hover {
echo   background: rgba(220, 38, 38, 0.2^);
echo }
echo.
echo @media (max-width: 768px^) {
echo   .bottom-sheet {
echo     padding-bottom: env(safe-area-inset-bottom, 24px^);
echo   }
echo }
) > src\components\BottomSheet.css

REM src/components/Footer.jsx letrehozasa
echo 📝 src/components/Footer.jsx letrehozasa...
if not exist "src\components" mkdir src\components
(
echo import React from 'react'
echo import './Footer.css'
echo.
echo function Footer(^) {
echo   return (
echo     ^<footer className="app-footer"^>
echo       ^<div className="footer-content"^>
echo         ^<span className="footer-text"^>
echo           © 2025 Vista Appstore, Minden jog fenntartva.
echo         ^</span^>
echo         ^<img
echo           src="/vista-verde-192.png"
echo           alt="Vista Verde Logo"
echo           className="footer-logo"
echo         /^>
echo       ^</div^>
echo     ^</footer^>
echo   ^)
echo }
echo.
echo export default Footer
) > src\components\Footer.jsx

REM src/components/Footer.css letrehozasa
echo 📝 src/components/Footer.css letrehozasa...
(
echo /* src/components/Footer.css */
echo .app-footer {
echo   position: fixed;
echo   bottom: 0;
echo   left: 0;
echo   right: 0;
echo   background: rgba(255, 255, 255, 0.95^);
echo   backdrop-filter: blur(20px^);
echo   border-top: 1px solid var(--surface-border^);
echo   padding: 8px 16px;
echo   z-index: 5; /* Az app elemek alatt, de a canvas felett */
echo   box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.05^);
echo }
echo.
echo .footer-content {
echo   max-width: 1200px;
echo   margin: 0 auto;
echo   display: flex;
echo   justify-content: center;
echo   align-items: center;
echo   gap: 8px;
echo }
echo.
echo .footer-text {
echo   color: var(--text-secondary^);
echo   font-size: 11px;
echo   font-weight: 500;
echo   text-align: center;
echo }
echo.
echo .footer-logo {
echo   width: 16px;
echo   height: 16px;
echo   opacity: 0.8;
echo   transition: opacity 0.2s;
echo }
echo.
echo .footer-logo:hover {
echo   opacity: 1;
echo }
echo.
echo @media (max-width: 768px^) {
echo   .app-footer {
echo     padding: 6px 12px;
echo     padding-bottom: calc(6px + env(safe-area-inset-bottom^)^);
echo   }
echo.
echo   .footer-text {
echo     font-size: 10px;
echo   }
echo.
echo   .footer-logo {
echo     width: 14px;
echo     height: 14px;
echo   }
echo }
) > src\components\Footer.css

REM public/index.html frissitese
echo 📝 public/index.html frissitese...
(
echo ^<!doctype html^>
echo ^<html lang="hu"^>
echo   ^<head^>
echo     ^<meta charset="UTF-8" /^>
echo     ^<!-- Vista Verde favicon --^>
echo     ^<link rel="icon" type="image/svg+xml" href="/vista-verde.svg" /^>
echo     ^<link rel="apple-touch-icon" href="/vista-verde-192.png" /^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" /^>
echo     ^<meta name="theme-color" content="#01918C" /^>
echo     ^<meta name="apple-mobile-web-app-capable" content="yes"^>
echo     ^<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"^>
echo     ^<title^>Pálcikaember - Szerepek tisztázása^</title^>
echo     ^<link rel="manifest" href="/manifest.json"^>
echo   ^</head^>
echo   ^<body^>
echo     ^<div id="root"^>^</div^>
echo     ^<script type="module" src="/src/main.jsx"^>^</script^>
echo   ^</body^>
echo ^</html^>
) > public\index.html

REM public/manifest.json frissitese
echo 📝 public/manifest.json frissitese...
(
echo {
echo   "name": "Pálcikaember - Szerepek tisztázása",
echo   "short_name": "Pálcikaember",
echo   "description": "Vizuális eszköz life coaching szerepek tisztázásához",
echo   "theme_color": "#01918C",
echo   "background_color": "#FFFFFF",
echo   "display": "standalone",
echo   "orientation": "portrait",
echo   "scope": "/",
echo   "start_url": "/",
echo   "icons": [
echo     {
echo       "src": "/vista-verde.svg",
echo       "sizes": "any",
echo       "type": "image/svg+xml"
echo     },
echo     {
echo       "src": "/vista-verde-192.png",
echo       "sizes": "192x192",
echo       "type": "image/png"
echo     },
echo     {
echo       "src": "/vista-verde-512.png",
echo       "sizes": "512x512",
echo       "type": "image/png"
echo     }
echo   ]
echo }
) > public\manifest.json

REM public/vista-verde.svg letrehozasa
echo 📝 public/vista-verde.svg letrehozasa...
(
echo ^<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200"^>
echo   ^<!-- Circles --^>
echo   ^<circle cx="100" cy="100" r="95" fill="none" stroke="#4ADE80" stroke-width="3"/^>
echo   ^<circle cx="100" cy="100" r="80" fill="none" stroke="#22C55E" stroke-width="4"/^>
echo   ^<circle cx="100" cy="100" r="65" fill="none" stroke="#16A34A" stroke-width="5"/^>
echo   ^<circle cx="100" cy="100" r="50" fill="none" stroke="#15803D" stroke-width="6"/^>
echo.  
echo   ^<!-- Dots around circles --^>
echo   ^<circle cx="195" cy="100" r="3" fill="#4ADE80"/^>
echo   ^<circle cx="180" cy="140" r="2.5" fill="#22C55E"/^>
echo   ^<circle cx="160" cy="170" r="2" fill="#16A34A"/^>
echo   ^<circle cx="130" cy="185" r="1.5" fill="#15803D"/^>
echo   ^<circle cx="70" cy="185" r="1.5" fill="#15803D"/^>
echo   ^<circle cx="40" cy="170" r="2" fill="#16A34A"/^>
echo   ^<circle cx="20" cy="140" r="2.5" fill="#22C55E"/^>
echo   ^<circle cx="5" cy="100" r="3" fill="#4ADE80"/^>
echo.  
echo   ^<!-- Text --^>
echo   ^<text x="100" y="88" text-anchor="middle" font-family="Arial, sans-serif" font-size="24" font-weight="bold" fill="#1F2937"^>VISTA^</text^>
echo   ^<text x="100" y="114" text-anchor="middle" font-family="Arial, sans-serif" font-size="24" font-weight="bold" fill="#1F2937"^>VERDE^</text^>
echo ^</svg^>
) > public\vista-verde.svg

REM src/components/RoleCard.jsx frissitese (szabad drag)
echo 📝 src/components/RoleCard.jsx frissitese (szabad drag^)...
(
echo import { useState, useRef, useEffect } from 'react'
echo import { motion, useDragControls } from 'framer-motion'
echo import { X } from 'lucide-react'
echo import './RoleCard.css'
echo.
echo function RoleCard(^{ role, isSelected, onSelect, onUpdate, onDelete }^) {
echo   const [isEditing, setIsEditing] = useState(role.isEditing ^|^| false^)
echo   const [editText, setEditText] = useState(role.text^)
echo   const dragControls = useDragControls(^)
echo   const inputRef = useRef(null^)
echo.
echo   useEffect(^(^) =^> {
echo     if (role.isEditing^) {
echo       setIsEditing(true^)
echo     }
echo   }, [role.isEditing]^)
echo.
echo   useEffect(^(^) =^> {
echo     if (isEditing ^&^& inputRef.current^) {
echo       inputRef.current.focus(^)
echo       // Ha "Új szerep" a szöveg, törölj ki amikor belekattintanak
echo       if (editText === 'Új szerep'^) {
echo         setEditText('')
echo       } else {
echo         inputRef.current.setSelectionRange(0, 0^)
echo       }
echo     }
echo   }, [isEditing]^)
echo.
echo   const handleSaveEdit = ^(^) =^> {
echo     const textToSave = editText.trim(^) ^|^| 'Új szerep'
echo     onUpdate(role.id, { text: textToSave, isEditing: false }^)
echo     setIsEditing(false^)
echo   }
echo.
echo   const handleKeyPress = (e^) =^> {
echo     if (e.key === 'Enter'^) {
echo       handleSaveEdit(^)
echo     }
echo     if (e.key === 'Escape'^) {
echo       setEditText(role.text^)
echo       setIsEditing(false^)
echo     }
echo   }
echo.
echo   return (
echo     ^<motion.div
echo       className={`role-card ${isSelected ? 'selected' : ''}`}
echo       data-role-id={role.id}
echo       style={{
echo         left: role.position.x,
echo         top: role.position.y,
echo         borderColor: role.color,
echo         boxShadow: isSelected ? `0 0 20px ${role.color}40` : 'none'
echo       }}
echo       drag
echo       dragControls={dragControls}
echo       dragMomentum={false}
echo       dragElastic={0}
echo       // ELTÁVOLÍTVA: dragConstraints - most bárhova lehet mozgatni
echo       onDragEnd={(e, info^) =^> {
echo         // Csak a minimum határokat tartjuk meg (ne menjen ki a képernyőből teljesen^)
echo         const newX = Math.max(-100, role.position.x + info.offset.x^) // -100px: részben kilóghat
echo         const newY = Math.max(0, role.position.y + info.offset.y^) // Felül ne menjen ki
echo.        
echo         onUpdate(role.id, {
echo           position: {
echo             x: newX,
echo             y: newY
echo           }
echo         }^)
echo       }}
echo       onClick={^(^) =^> {
echo         if (^!isEditing^) {
echo           setIsEditing(true^)
echo           onSelect(^)
echo         }
echo       }}
echo       initial={{ scale: 0, opacity: 0 }}
echo       animate={{ scale: 1, opacity: 1 }}
echo       exit={{ scale: 0, opacity: 0 }}
echo       transition={{ type: 'spring', damping: 20, stiffness: 300 }}
echo       whileHover={{ scale: 1.05 }}
echo       whileTap={{ scale: 0.95 }}
echo     ^>
echo       ^<div
echo         className="role-card-color-indicator"
echo         style={{ backgroundColor: role.color }}
echo       /^>
echo.      
echo       ^<div className="role-card-content"^>
echo         {isEditing ? (
echo           ^<input
echo             ref={inputRef}
echo             type="text"
echo             value={editText}
echo             onChange={(e^) =^> setEditText(e.target.value^)}
echo             onKeyDown={handleKeyPress}
echo             onBlur={handleSaveEdit}
echo             className="role-card-input"
echo             placeholder="Írj be egy szerepet..."
echo             onClick={(e^) =^> e.stopPropagation(^)}
echo           /^>
echo         ^) : (
echo           ^<span className="role-card-text"^>{role.text}^</span^>
echo         ^)}
echo       ^</div^>
echo.      
echo       ^<div className="role-card-actions"^>
echo         ^<motion.button
echo           className="role-card-action delete"
echo           onClick={(e^) =^> {
echo             e.stopPropagation(^)
echo             onDelete(role.id^)
echo           }}
echo           whileTap={{ scale: 0.8 }}
echo         ^>
echo           ^<X size={16} /^>
echo         ^</motion.button^>
echo       ^</div^>
echo     ^</motion.div^>
echo   ^)
echo }
echo.
echo export default RoleCard
) > src\components\RoleCard.jsx

REM src/components/ColorPicker.jsx frissitese (draggable)
echo 📝 src/components/ColorPicker.jsx frissitese (draggable^)...
(
echo import { motion, useDragControls } from 'framer-motion'
echo import { X, GripVertical } from 'lucide-react'
echo import './ColorPicker.css'
echo.
echo const colors = [
echo   '#8B5CF6', // Purple
echo   '#EC4899', // Pink
echo   '#EF4444', // Red
echo   '#F97316', // Orange
echo   '#F59E0B', // Amber
echo   '#84CC16', // Lime
echo   '#10B981', // Emerald
echo   '#06B6D4', // Cyan
echo   '#3B82F6', // Blue
echo   '#6366F1', // Indigo
echo   '#A855F7', // Violet
echo   '#F43F5E', // Rose
echo ]
echo.
echo function ColorPicker(^{ currentColor, onColorChange, onClose }^) {
echo   const dragControls = useDragControls(^)
echo.
echo   return (
echo     ^<motion.div
echo       className="color-picker"
echo       drag
echo       dragControls={dragControls}
echo       dragMomentum={false}
echo       dragElastic={0}
echo       dragConstraints={{
echo         left: 10,
echo         right: window.innerWidth - 300, // színválasztó szélessége - 280px + padding
echo         top: 80, // header alatt
echo         bottom: window.innerHeight - 400 // footer felett + magasság
echo       }}
echo       initial={{ opacity: 0, y: 100 }}
echo       animate={{ opacity: 1, y: 0 }}
echo       exit={{ opacity: 0, y: 100 }}
echo       transition={{ type: 'spring', damping: 25, stiffness: 300 }}
echo     ^>
echo       ^<div className="color-picker-header"^>
echo         ^<div className="color-picker-title-section"^>
echo           ^<motion.div
echo             className="color-picker-drag-handle"
echo             onPointerDown={(e^) =^> dragControls.start(e^)}
echo             whileHover={{ scale: 1.1 }}
echo             whileTap={{ scale: 0.9 }}
echo           ^>
echo             ^<GripVertical size={16} /^>
echo           ^</motion.div^>
echo           ^<h3^>Válassz színt^</h3^>
echo         ^</div^>
echo         ^<motion.button
echo           className="color-picker-close"
echo           onClick={onClose}
echo           whileTap={{ scale: 0.9 }}
echo         ^>
echo           ^<X size={20} /^>
echo         ^</motion.button^>
echo       ^</div^>
echo.      
echo       ^<div className="color-picker-grid"^>
echo         {colors.map(color =^> (
echo           ^<motion.button
echo             key={color}
echo             className={`color-option ${currentColor === color ? 'selected' : ''}`}
echo             style={{ backgroundColor: color }}
echo             onClick={^(^) =^> onColorChange(color^)}
echo             whileHover={{ scale: 1.1 }}
echo             whileTap={{ scale: 0.9 }}
echo           ^>
echo             {currentColor === color ^&^& (
echo               ^<motion.div
echo                 className="color-selected-indicator"
echo                 initial={{ scale: 0 }}
echo                 animate={{ scale: 1 }}
echo               ^>
echo                 ✓
echo               ^</motion.div^>
echo             ^)}
echo           ^</motion.button^>
echo         ^)^)}
echo       ^</div^>
echo.      
echo       ^<div className="color-picker-custom"^>
echo         ^<label htmlFor="custom-color"^>Egyéni szín:^</label^>
echo         ^<input
echo           id="custom-color"
echo           type="color"
echo           value={currentColor}
echo           onChange={(e^) =^> onColorChange(e.target.value^)}
echo           className="custom-color-input"
echo         /^>
echo       ^</div^>
echo     ^</motion.div^>
echo   ^)
echo }
echo.
echo export default ColorPicker
) > src\components\ColorPicker.jsx

REM src/components/StickmanCanvas.jsx frissitese (fekete palcikaember)
echo 📝 src/components/StickmanCanvas.jsx frissitese (fekete palcikaember^)...
(
echo import { useEffect, useRef, forwardRef, useImperativeHandle } from 'react'
echo import './StickmanCanvas.css'
echo.
echo const StickmanCanvas = forwardRef(^(^{ roles, selectedRole }, ref^) =^> {
echo   const canvasRef = useRef(null^)
echo   const animationRef = useRef(null^)
echo   const centerRef = useRef(^{ x: 0, y: 0 }^)
echo.
echo   useImperativeHandle(ref, ^(^) =^> (^{
echo     exportImage: (fileName^) =^> {
echo       const canvas = canvasRef.current
echo       if (^!canvas^) return
echo.
echo       // Create export canvas
echo       const exportCanvas = document.createElement('canvas'^)
echo       exportCanvas.width = canvas.width
echo       exportCanvas.height = canvas.height
echo       const exportCtx = exportCanvas.getContext('2d'^)
echo.
echo       // Draw white background
echo       exportCtx.fillStyle = '#FFFFFF'
echo       exportCtx.fillRect(0, 0, canvas.width, canvas.height^)
echo.
echo       // Draw everything
echo       drawStickman(exportCtx, centerRef.current^)
echo       drawConnections(exportCtx, centerRef.current, roles^)
echo       drawRoleBoxes(exportCtx, roles^)
echo.
echo       // Export
echo       exportCanvas.toBlob(blob =^> {
echo         const link = document.createElement('a'^)
echo         link.download = `${fileName}.png`
echo         link.href = URL.createObjectURL(blob^)
echo         link.click(^)
echo         setTimeout(^(^) =^> URL.revokeObjectURL(link.href^), 1000^)
echo       }, 'image/png'^)
echo     }
echo   }^)^)
echo.
echo   const drawStickman = (ctx, center^) =^> {
echo     const scale = Math.min(window.innerWidth, window.innerHeight^) / 500
echo     const headRadius = 25 * scale
echo     const bodyLength = 80 * scale
echo.    
echo     // Head - FEKETE
echo     ctx.strokeStyle = '#000000'
echo     ctx.lineWidth = 3 * scale
echo     ctx.beginPath(^)
echo     ctx.arc(center.x, center.y - bodyLength/2, headRadius, 0, Math.PI * 2^)
echo     ctx.stroke(^)
echo.    
echo     // Eyes - FEKETE
echo     ctx.fillStyle = '#000000'
echo     ctx.beginPath(^)
echo     ctx.arc(center.x - 8*scale, center.y - bodyLength/2 - 5*scale, 3*scale, 0, Math.PI * 2^)
echo     ctx.arc(center.x + 8*scale, center.y - bodyLength/2 - 5*scale, 3*scale, 0, Math.PI * 2^)
echo     ctx.fill(^)
echo.    
echo     // Smile - FEKETE
echo     ctx.strokeStyle = '#000000'
echo     ctx.lineWidth = 2 * scale
echo     ctx.beginPath(^)
echo     ctx.arc(center.x, center.y - bodyLength/2 + 5*scale, 12*scale, 0.2 * Math.PI, 0.8 * Math.PI^)
echo     ctx.stroke(^)
echo.    
echo     // Body - FEKETE
echo     ctx.strokeStyle = '#000000'
echo     ctx.lineWidth = 3 * scale
echo     ctx.beginPath(^)
echo     ctx.moveTo(center.x, center.y - bodyLength/2 + headRadius^)
echo     ctx.lineTo(center.x, center.y + bodyLength/2^)
echo     ctx.stroke(^)
echo.    
echo     // Arms - FEKETE
echo     ctx.beginPath(^)
echo     ctx.moveTo(center.x - 40*scale, center.y - 10*scale^)
echo     ctx.lineTo(center.x + 40*scale, center.y - 10*scale^)
echo     ctx.stroke(^)
echo.    
echo     // Legs - FEKETE
echo     ctx.beginPath(^)
echo     ctx.moveTo(center.x, center.y + bodyLength/2^)
echo     ctx.lineTo(center.x - 30*scale, center.y + bodyLength/2 + 50*scale^)
echo     ctx.moveTo(center.x, center.y + bodyLength/2^)
echo     ctx.lineTo(center.x + 30*scale, center.y + bodyLength/2 + 50*scale^)
echo     ctx.stroke(^)
echo   }
echo.
echo   const drawConnections = (ctx, center, roles^) =^> {
echo     roles.forEach(role =^> {
echo       // Keressük meg a DOM elemet az id alapján
echo       const roleElement = document.querySelector(`[data-role-id="${role.id}"]`^)
echo       if (^!roleElement^) return
echo.      
echo       const rect = roleElement.getBoundingClientRect(^)
echo       const canvasRect = ctx.canvas.getBoundingClientRect(^)
echo.      
echo       // Számoljuk ki a pontos pozíciót a canvas koordináta rendszerében
echo       const roleX = rect.left - canvasRect.left + rect.width / 2
echo       const roleY = rect.top - canvasRect.top + rect.height / 2
echo.      
echo       const dx = roleX - center.x
echo       const dy = roleY - center.y
echo       const dist = Math.sqrt(dx*dx + dy*dy^)
echo.      
echo       if (dist ^> 0^) {
echo         // A pálcikaembertől induló pont (a teste széléről^)
echo         const fromX = center.x + (dx/dist^) * 40
echo         const fromY = center.y + (dy/dist^) * 40
echo.        
echo         // A szerepkártya széléig (ne a közepéig^)
echo         const toX = roleX - (dx/dist^) * (rect.width / 2^)
echo         const toY = roleY - (dy/dist^) * (rect.height / 2^)
echo.        
echo         // Gradient line
echo         const gradient = ctx.createLinearGradient(fromX, fromY, toX, toY^)
echo         gradient.addColorStop(0, role.color + '60'^)
echo         gradient.addColorStop(1, role.color^)
echo.        
echo         ctx.strokeStyle = gradient
echo         ctx.lineWidth = 3
echo         ctx.lineCap = 'round'
echo         ctx.beginPath(^)
echo         ctx.moveTo(fromX, fromY^)
echo         ctx.lineTo(toX, toY^)
echo         ctx.stroke(^)
echo.        
echo         // Connection point at role card
echo         ctx.fillStyle = role.color
echo         ctx.beginPath(^)
echo         ctx.arc(toX, toY, 4, 0, Math.PI * 2^)
echo         ctx.fill(^)
echo       }
echo     }^)
echo   }
echo.
echo   const drawRoleBoxes = (ctx, roles^) =^> {
echo     roles.forEach(role =^> {
echo       const roleElement = document.querySelector(`[data-role-id="${role.id}"]`^)
echo       if (^!roleElement^) {
echo         // Fallback ha nincs DOM elem (export esetén^)
echo         ctx.fillStyle = '#FFFFFF'
echo         ctx.fillRect(role.position.x, role.position.y, 120, 60^)
echo         ctx.strokeStyle = role.color
echo         ctx.lineWidth = 2
echo         ctx.strokeRect(role.position.x, role.position.y, 120, 60^)
echo         ctx.fillStyle = '#111827'
echo         ctx.font = '16px -apple-system, BlinkMacSystemFont, sans-serif'
echo         ctx.textAlign = 'center'
echo         ctx.textBaseline = 'middle'
echo         ctx.fillText(role.text, role.position.x + 60, role.position.y + 30^)
echo         return
echo       }
echo.      
echo       const rect = roleElement.getBoundingClientRect(^)
echo       const canvasRect = ctx.canvas.getBoundingClientRect(^)
echo.      
echo       const boxX = rect.left - canvasRect.left
echo       const boxY = rect.top - canvasRect.top
echo.      
echo       // Box background - FEHÉR
echo       ctx.fillStyle = '#FFFFFF'
echo       ctx.fillRect(boxX, boxY, rect.width, rect.height^)
echo.      
echo       // Box border
echo       ctx.strokeStyle = role.color
echo       ctx.lineWidth = 2
echo       ctx.strokeRect(boxX, boxY, rect.width, rect.height^)
echo.      
echo       // Text - FEKETE (jobb kontraszt^)
echo       ctx.fillStyle = '#111827'
echo       ctx.font = '14px -apple-system, BlinkMacSystemFont, sans-serif'
echo       ctx.textAlign = 'center'
echo       ctx.textBaseline = 'middle'
echo       ctx.fillText(role.text, boxX + rect.width/2, boxY + rect.height/2^)
echo     }^)
echo   }
echo.
echo   const draw = ^(^) =^> {
echo     const canvas = canvasRef.current
echo     if (^!canvas^) return
echo.    
echo     const ctx = canvas.getContext('2d'^)
echo     const width = window.innerWidth
echo     const height = window.innerHeight
echo.    
echo     canvas.width = width
echo     canvas.height = height
echo.    
echo     // Update center
echo     centerRef.current = {
echo       x: width / 2,
echo       y: height / 2 - 50
echo     }
echo.    
echo     // Clear and draw WHITE background
echo     ctx.fillStyle = '#FFFFFF'
echo     ctx.fillRect(0, 0, width, height^)
echo.    
echo     // Draw stickman and connections
echo     drawStickman(ctx, centerRef.current^)
echo     drawConnections(ctx, centerRef.current, roles^)
echo   }
echo.
echo   useEffect(^(^) =^> {
echo     const animate = ^(^) =^> {
echo       draw(^)
echo       animationRef.current = requestAnimationFrame(animate^)
echo     }
echo.    
echo     // Kis késleltetés, hogy a DOM elemek biztosan renderelődjenek
echo     const timeoutId = setTimeout(^(^) =^> {
echo       animate(^)
echo     }, 100^)
echo.    
echo     const handleResize = ^(^) =^> draw(^)
echo     window.addEventListener('resize', handleResize^)
echo.    
echo     return ^(^) =^> {
echo       clearTimeout(timeoutId^)
echo       if (animationRef.current^) {
echo         cancelAnimationFrame(animationRef.current^)
echo       }
echo       window.removeEventListener('resize', handleResize^)
echo     }
echo   }, [roles]^)
echo.
echo   return ^<canvas ref={canvasRef} className="stickman-canvas" /^>
echo }^)
echo.
echo StickmanCanvas.displayName = 'StickmanCanvas'
echo.
echo export default StickmanCanvas
) > src\components\StickmanCanvas.jsx

REM src/App.jsx frissitese (Footer hozzaadva)
echo 📝 src/App.jsx frissitese (Footer hozzaadva^)...
(
echo import { useState, useRef, useEffect } from 'react'
echo import { motion, AnimatePresence } from 'framer-motion'
echo import { Plus, Download, Palette, User, X, Edit2, Check } from 'lucide-react'
echo import StickmanCanvas from './components/StickmanCanvas'
echo import RoleCard from './components/RoleCard'
echo import FloatingActionButton from './components/FloatingActionButton'
echo import ColorPicker from './components/ColorPicker'
echo import BottomSheet from './components/BottomSheet'
echo import Header from './components/Header'
echo import Footer from './components/Footer'
echo import './App.css'
echo.
echo function App(^) {
echo   const [roles, setRoles] = useState([])
echo   const [selectedRole, setSelectedRole] = useState(null^)
echo   const [currentColor, setCurrentColor] = useState('#8B5CF6'^)
echo   const [showColorPicker, setShowColorPicker] = useState(false^)
echo   const [fileName, setFileName] = useState('szerepek'^)
echo   const [showBottomSheet, setShowBottomSheet] = useState(false^)
echo   const [saveMessage, setSaveMessage] = useState(''^)
echo   const canvasRef = useRef(null^)
echo.
echo   const addRole = ^(^) =^> {
echo     const N = roles.length
echo     const radius = 150 + 32 * Math.floor(N / 8^) // Koncentrikus körök
echo     // Kezdjük 12 óránál (-π/2^) és haladjunk óramutató járása szerint
echo     const angle = -Math.PI/2 + (N %% 8^) * (Math.PI / 4^) // 8 pozíció körönként (45 fokonként^)
echo     const centerX = window.innerWidth / 2
echo     const centerY = window.innerHeight / 2 - 50
echo.    
echo     const newRole = {
echo       id: Date.now(^),
echo       text: 'Új szerep',
echo       color: currentColor,
echo       position: {
echo         // FRISSÍTVE: Bárhova lehet tenni, csak a minimum határokat tartjuk
echo         x: Math.max(-50, centerX + radius * Math.cos(angle^) - 60^),
echo         y: Math.max(80, centerY + radius * Math.sin(angle^) - 30^) // Header alatt
echo       },
echo       isEditing: true
echo     }
echo     setRoles([...roles, newRole]^)
echo     setSelectedRole(newRole.id^)
echo     setShowBottomSheet(false^) // Ne nyissa meg a bottom sheet-et
echo   }
echo.
echo   const updateRole = (id, updates^) =^> {
echo     setRoles(roles.map(role =^> 
echo       role.id === id ? { ...role, ...updates } : role
echo     ^)^)
echo   }
echo.
echo   const deleteRole = (id^) =^> {
echo     setRoles(roles.filter(role =^> role.id !== id^)^)
echo     if (selectedRole === id^) {
echo       setSelectedRole(null^)
echo       setShowBottomSheet(false^)
echo     }
echo   }
echo.
echo   const handleSave = ^(^) =^> {
echo     if (canvasRef.current^) {
echo       canvasRef.current.exportImage(fileName^)
echo       setSaveMessage('✨ Sikeresen mentve!'^)
echo       setTimeout(^(^) =^> setSaveMessage(''^), 3000^)
echo     }
echo   }
echo.
echo   const handleRoleSelect = (roleId^) =^> {
echo     setSelectedRole(roleId^)
echo     // Nem nyitjuk meg automatikusan a BottomSheet-et
echo   }
echo.
echo   const selectedRoleData = roles.find(r =^> r.id === selectedRole^)
echo.
echo   return (
echo     ^<div className="app"^>
echo       ^<Header
echo         fileName={fileName}
echo         onFileNameChange={setFileName}
echo         onSave={handleSave}
echo       /^>
echo.      
echo       ^<StickmanCanvas
echo         ref={canvasRef}
echo         roles={roles}
echo         selectedRole={selectedRole}
echo       /^>
echo.      
echo       ^<div className="roles-container"^>
echo         ^<AnimatePresence^>
echo           {roles.map(role =^> (
echo             ^<RoleCard
echo               key={role.id}
echo               role={role}
echo               isSelected={selectedRole === role.id}
echo               onSelect={^(^) =^> handleRoleSelect(role.id^)}
echo               onUpdate={updateRole}
echo               onDelete={deleteRole}
echo             /^>
echo           ^)^)}
echo         ^</AnimatePresence^>
echo       ^</div^>
echo.      
echo       ^<FloatingActionButton
echo         icon={^<Plus size={24} /^>}
echo         onClick={addRole}
echo         color="#8B5CF6"
echo       /^>
echo.      
echo       ^<motion.button
echo         className="color-picker-fab"
echo         onClick={^(^) =^> setShowColorPicker(^!showColorPicker^)}
echo         whileTap={{ scale: 0.9 }}
echo         style={{ backgroundColor: currentColor }}
echo       ^>
echo         ^<Palette size={20} color="white" /^>
echo       ^</motion.button^>
echo.      
echo       ^<AnimatePresence^>
echo         {showColorPicker ^&^& (
echo           ^<ColorPicker
echo             currentColor={currentColor}
echo             onColorChange={(color^) =^> {
echo               setCurrentColor(color^)
echo               if (selectedRole^) {
echo                 updateRole(selectedRole, { color }^)
echo               }
echo             }}
echo             onClose={^(^) =^> setShowColorPicker(false^)}
echo           /^>
echo         ^)}
echo       ^</AnimatePresence^>
echo.      
echo       ^<AnimatePresence^>
echo         {showBottomSheet ^&^& selectedRoleData ^&^& (
echo           ^<BottomSheet
echo             role={selectedRoleData}
echo             onUpdate={updateRole}
echo             onClose={^(^) =^> setShowBottomSheet(false^)}
echo             onDelete={deleteRole}
echo           /^>
echo         ^)}
echo       ^</AnimatePresence^>
echo.      
echo       ^<AnimatePresence^>
echo         {saveMessage ^&^& (
echo           ^<motion.div
echo             className="save-message"
echo             initial={{ opacity: 0, y: 50 }}
echo             animate={{ opacity: 1, y: 0 }}
echo             exit={{ opacity: 0, y: 50 }}
echo           ^>
echo             {saveMessage}
echo           ^</motion.div^>
echo         ^)}
echo       ^</AnimatePresence^>
echo.      
echo       ^<Footer /^>
echo     ^</div^>
echo   ^)
echo }
echo.
echo export default App
) > src\App.jsx

echo.
echo 🎉 KESZ! Osszes fajl frissitve!
echo.
echo 📋 Kovetkezo lepesek:
echo 1. Futtasd le ezt a bat fajlt
echo 2. git add .
echo 3. git commit -m "🎨 Vilagos tema + Vista Verde branding"
echo 4. git push origin main
echo.
echo 🚀 Minden fajl frissult a vilagos temara es Vista Verde brandingre!
pause