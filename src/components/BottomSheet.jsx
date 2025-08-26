import { useState } from 'react'
import { motion } from 'framer-motion'
import { Edit2, Trash2 } from 'lucide-react'
import './BottomSheet.css'

function BottomSheet({ role, onUpdate, onClose, onDelete }) {
  const [editText, setEditText] = useState(role.text)
  const [isEditing, setIsEditing] = useState(false)

  const handleSave = () => {
    onUpdate(role.id, { text: editText })
    setIsEditing(false)
    onClose() // Automatikusan bezárja mentés után
  }

  const handleDelete = () => {
    if (window.confirm('Biztosan törölni szeretnéd ezt a szerepet?')) {
      onDelete(role.id)
      onClose()
    }
  }

  return (
    <motion.div
      className="bottom-sheet-overlay"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      onClick={onClose}
    >
      <motion.div
        className="bottom-sheet"
        initial={{ y: '100%' }}
        animate={{ y: 0 }}
        exit={{ y: '100%' }}
        transition={{ type: 'spring', damping: 30, stiffness: 300 }}
        onClick={(e) => e.stopPropagation()}
      >
        <div className="bottom-sheet-handle" />
        
        <div className="bottom-sheet-header">
          <h3>Szerep szerkesztése</h3>
        </div>
        
        <div className="bottom-sheet-content">
          <div className="bottom-sheet-field">
            <label>Név</label>
            {isEditing ? (
              <div className="bottom-sheet-edit-container">
                <input
                  type="text"
                  value={editText}
                  onChange={(e) => setEditText(e.target.value)}
                  className="bottom-sheet-input"
                  autoFocus
                />
                <motion.button
                  className="bottom-sheet-save-btn"
                  onClick={handleSave}
                  whileTap={{ scale: 0.9 }}
                >
                  Mentés
                </motion.button>
              </div>
            ) : (
              <div className="bottom-sheet-text-container">
                <span className="bottom-sheet-text">{role.text}</span>
                <motion.button
                  className="bottom-sheet-edit-btn"
                  onClick={() => setIsEditing(true)}
                  whileTap={{ scale: 0.9 }}
                >
                  <Edit2 size={16} />
                </motion.button>
              </div>
            )}
          </div>
          
          <div className="bottom-sheet-actions">
            <motion.button
              className="bottom-sheet-action-btn delete"
              onClick={handleDelete}
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
            >
              <Trash2 size={18} />
              Törlés
            </motion.button>
          </div>
        </div>
      </motion.div>
    </motion.div>
  )
}

export default BottomSheet
