// 1. FOOTER KOMPONENS (src/components/Footer.jsx) - ÚJ FÁJL
import React from 'react'
import './Footer.css'

function Footer() {
  return (
    <footer className="app-footer">
      <div className="footer-content">
        <span className="footer-text">
          © 2025 Vista Appstore, Minden jog fenntartva.
        </span>
        <img 
          src="/vista-verde-192.png" 
          alt="Vista Verde Logo" 
          className="footer-logo"
        />
      </div>
    </footer>
  )
}

export default Footer

// --------------------------------------------------

// 2. ROLECARD SZABAD DRAG (src/components/RoleCard.jsx) - MÓDOSÍTÁS
// Töröld ki ezt a részt a RoleCard.jsx-ből:
/*
dragConstraints={{
  left: 0,
  right: window.innerWidth - 140,
  top: 60,
  bottom: window.innerHeight - 80
}}
*/

// És helyette csak ezt hagyd meg:
// dragMomentum={false}
// dragElastic={0}

// --------------------------------------------------

// 3. COLORPICKER DRAGGABLE (src/components/ColorPicker.jsx) - MÓDOSÍTÁS
// Add hozzá a motion import-hoz:
import { motion, useDragControls } from 'framer-motion'
import { X, GripVertical } from 'lucide-react'

// A ColorPicker function elején add hozzá:
function ColorPicker({ currentColor, onColorChange, onClose }) {
  const dragControls = useDragControls()

  return (
    <motion.div
      className="color-picker"
      drag
      dragControls={dragControls}
      dragMomentum={false}
      dragElastic={0}
      // ... többi kód
    >
      <div className="color-picker-header">
        <div className="color-picker-title-section">
          <motion.div
            className="color-picker-drag-handle"
            onPointerDown={(e) => dragControls.start(e)}
          >
            <GripVertical size={16} />
          </motion.div>
          <h3>Válassz színt</h3>
        </div>
        {/* ... többi kód */}
      </div>
    </motion.div>
  )
}