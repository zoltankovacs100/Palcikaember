import { motion, useDragControls } from 'framer-motion'
import { X, GripVertical } from 'lucide-react'
import './ColorPicker.css'

const colors = [
  '#8B5CF6', '#EC4899', '#EF4444', '#F97316', '#F59E0B', '#84CC16',
  '#10B981', '#06B6D4', '#3B82F6', '#6366F1', '#A855F7', '#F43F5E'
]

function ColorPicker({ currentColor, onColorChange, onClose }) {
  const dragControls = useDragControls()

  return (
    <motion.div
      className="color-picker"
      drag={true} // Explicit true
      dragControls={dragControls}
      dragMomentum={false}
      dragElastic={0}
      // NINCS dragConstraints!
      // NINCS position style!
      initial={{ opacity: 0, scale: 0.8 }}
      animate={{ opacity: 1, scale: 1 }}
      exit={{ opacity: 0, scale: 0.8 }}
      transition={{ type: 'spring', damping: 25, stiffness: 300 }}
    >
      <div className="color-picker-header">
        <div className="color-picker-title-section">
          <motion.div
            className="color-picker-drag-handle"
            onPointerDown={(e) => {
              e.preventDefault()
              dragControls.start(e)
            }}
            whileHover={{ scale: 1.1 }}
            whileTap={{ scale: 0.9 }}
          >
            <GripVertical size={16} />
          </motion.div>
          <h3>Válassz színt</h3>
        </div>
        <motion.button
          className="color-picker-close"
          onClick={onClose}
          whileTap={{ scale: 0.9 }}
        >
          <X size={20} />
        </motion.button>
      </div>
      
      <div className="color-picker-grid">
        {colors.map(color => (
          <motion.button
            key={color}
            className={`color-option ${currentColor === color ? 'selected' : ''}`}
            style={{ backgroundColor: color }}
            onClick={() => onColorChange(color)}
            whileHover={{ scale: 1.1 }}
            whileTap={{ scale: 0.9 }}
          >
            {currentColor === color && (
              <motion.div
                className="color-selected-indicator"
                initial={{ scale: 0 }}
                animate={{ scale: 1 }}
              >
                ✓
              </motion.div>
            )}
          </motion.button>
        ))}
      </div>
      
      <div className="color-picker-custom">
        <label htmlFor="custom-color">Egyéni szín:</label>
        <input
          id="custom-color"
          type="color"
          value={currentColor}
          onChange={(e) => onColorChange(e.target.value)}
          className="custom-color-input"
        />
      </div>
    </motion.div>
  )
}

export default ColorPicker