import { motion } from 'framer-motion'
import { Download, FileText } from 'lucide-react'
import './Header.css'

function Header({ fileName, onFileNameChange, onSave }) {
  return (
    <motion.header 
      className="header"
      initial={{ y: -100 }}
      animate={{ y: 0 }}
      transition={{ type: 'spring', damping: 20, stiffness: 300 }}
    >
      <div className="header-content">
        <div className="header-title">
          <h1>Pálcikaember</h1>
          <span className="header-subtitle">Szerepek tisztázása</span>
        </div>
        
        <div className="header-actions">
          <div className="header-filename">
            <FileText size={18} />
            <input
              type="text"
              value={fileName}
              onChange={(e) => onFileNameChange(e.target.value)}
              className="filename-input"
              placeholder="Fájlnév"
            />
          </div>
          
          <motion.button
            className="save-button"
            onClick={onSave}
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
          >
            <Download size={18} />
            Mentés
          </motion.button>
        </div>
      </div>
    </motion.header>
  )
}

export default Header