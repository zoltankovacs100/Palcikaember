import { useState, useRef, useEffect, useCallback } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { Plus, Download, Palette, User, X, Edit2, Check } from 'lucide-react'
import StickmanCanvas from './components/StickmanCanvas'
import RoleCard from './components/RoleCard'
import FloatingActionButton from './components/FloatingActionButton'
import ColorPicker from './components/ColorPicker'
import BottomSheet from './components/BottomSheet'
import Header from './components/Header'
import Footer from './components/Footer'
import './App.css'

function App() {
  const [roles, setRoles] = useState([])
  const [selectedRole, setSelectedRole] = useState(null)
  const [currentColor, setCurrentColor] = useState('#8B5CF6')
  const [showColorPicker, setShowColorPicker] = useState(false)
  const [fileName, setFileName] = useState('szerepek')
  const [showBottomSheet, setShowBottomSheet] = useState(false)
  const [saveMessage, setSaveMessage] = useState('')
  const canvasRef = useRef(null)

  const addRole = () => {
    const N = roles.length
    const radius = 150 + 32 * Math.floor(N / 8) // Koncentrikus körök
    // Kezdjük 12 óránál (-π/2) és haladjunk óramutató járása szerint
    const angle = -Math.PI/2 + (N % 8) * (Math.PI / 4) // 8 pozíció körönként (45 fokonként)
    const centerX = window.innerWidth / 2
    const centerY = window.innerHeight / 2 - 50
    
    const newRole = {
      id: Date.now(),
      text: 'Új szerep',
      color: currentColor,
      position: {
        // FRISSÍTVE: Bárhova lehet tenni, csak a minimum határokat tartjuk
        x: Math.max(-50, centerX + radius * Math.cos(angle) - 60),
        y: Math.max(80, centerY + radius * Math.sin(angle) - 30) // Header alatt
      },
      isEditing: true
    }
    setRoles([...roles, newRole])
    setSelectedRole(newRole.id)
    setShowBottomSheet(false) // Ne nyissa meg a bottom sheet-et
  }

  const updateRole = useCallback((id, updates) => {
    setRoles(prevRoles => 
      prevRoles.map(role => 
        role.id === id ? { ...role, ...updates } : role
      )
    )
  }, [])

  const deleteRole = (id) => {
    setRoles(roles.filter(role => role.id !== id))
    if (selectedRole === id) {
      setSelectedRole(null)
      setShowBottomSheet(false)
    }
  }

  const handleSave = () => {
    if (canvasRef.current) {
      canvasRef.current.exportPdf(fileName)
      setSaveMessage('✨ PDF sikeresen generálva!')
      setTimeout(() => setSaveMessage(''), 3000)
    }
  }

  const handleRoleSelect = useCallback((roleId) => {
    setSelectedRole(roleId)
    // Nem nyitjuk meg automatikusan a BottomSheet-et
  }, [])

  const selectedRoleData = roles.find(r => r.id === selectedRole)

  return (
    <div className="app">
      <Header 
        fileName={fileName}
        onFileNameChange={setFileName}
        onSave={handleSave}
      />
      
      <StickmanCanvas 
        ref={canvasRef}
        roles={roles}
        selectedRole={selectedRole}
      />
      
      <div className="roles-container">
        <AnimatePresence>
          {roles.map(role => (
            <RoleCard
              key={role.id}
              role={role}
              isSelected={selectedRole === role.id}
              onSelect={() => handleRoleSelect(role.id)}
              onUpdate={updateRole}
              onDelete={deleteRole}
            />
          ))}
        </AnimatePresence>
      </div>
      
      <FloatingActionButton
        icon={<Plus size={24} />}
        onClick={addRole}
        color="#8B5CF6"
      />
      
      <motion.button
        className="color-picker-fab"
        onClick={() => setShowColorPicker(!showColorPicker)}
        whileTap={{ scale: 0.9 }}
        style={{ backgroundColor: currentColor }}
      >
        <Palette size={20} color="white" />
      </motion.button>
      
      <AnimatePresence>
        {showColorPicker && (
          <ColorPicker
            currentColor={currentColor}
            onColorChange={(color) => {
              setCurrentColor(color)
              if (selectedRole) {
                updateRole(selectedRole, { color })
              }
            }}
            onClose={() => setShowColorPicker(false)}
          />
        )}
      </AnimatePresence>
      
      <AnimatePresence>
        {showBottomSheet && selectedRoleData && (
          <BottomSheet
            role={selectedRoleData}
            onUpdate={updateRole}
            onClose={() => setShowBottomSheet(false)}
            onDelete={deleteRole}
          />
        )}
      </AnimatePresence>
      
      <AnimatePresence>
        {saveMessage && (
          <motion.div
            className="save-message"
            initial={{ opacity: 0, y: 50 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: 50 }}
          >
            {saveMessage}
          </motion.div>
        )}
      </AnimatePresence>
      
      <Footer />
    </div>
  )
}

export default App