import { motion } from 'framer-motion'
import './FloatingActionButton.css'

function FloatingActionButton({ icon, onClick, color = '#8B5CF6' }) {
  return (
    <motion.button
      className="floating-action-button"
      onClick={onClick}
      style={{ backgroundColor: color }}
      whileHover={{ scale: 1.1 }}
      whileTap={{ scale: 0.9 }}
      initial={{ scale: 0 }}
      animate={{ scale: 1 }}
      transition={{ type: 'spring', damping: 15, stiffness: 300 }}
    >
      {icon}
    </motion.button>
  )
}

export default FloatingActionButton
