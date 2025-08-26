import { useState, useRef, useEffect } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { X } from 'lucide-react'
import './RoleCard.css'

function RoleCard({ role, isSelected, onSelect, onUpdate, onDelete }) {
  const [isEditing, setIsEditing] = useState(role.isEditing || false)
  const [editText, setEditText] = useState(role.text)
  const [isDragging, setIsDragging] = useState(false)
  const inputRef = useRef(null)
  const cardRef = useRef(null)
  const offsetRef = useRef({ x: 0, y: 0 })
  const pressStateRef = useRef({ startX: 0, startY: 0, startTime: 0, isPressing: false })

  useEffect(() => {
    if (role.isEditing) {
      setIsEditing(true)
    }
  }, [role.isEditing])

  useEffect(() => {
    if (isEditing && inputRef.current) {
      inputRef.current.focus()
      if (editText === 'Új szerep') {
        setEditText('')
      } else {
        inputRef.current.setSelectionRange(0, 0)
      }
    }
  }, [isEditing])

  // NATÍV DRAG RENDSZER
  useEffect(() => {
    const element = cardRef.current
    if (!element) return

    const handlePressStart = (clientX, clientY) => {
      if (isEditing) return
      pressStateRef.current = {
        startX: clientX,
        startY: clientY,
        startTime: Date.now(),
        isPressing: true,
      }
      offsetRef.current = {
        x: clientX - role.position.x,
        y: clientY - role.position.y,
      }
    }

    const handlePressMove = (clientX, clientY) => {
      if (!pressStateRef.current.isPressing) return
      
      if (!isDragging) {
        const dx = clientX - pressStateRef.current.startX
        const dy = clientY - pressStateRef.current.startY
        if (Math.abs(dx) > 5 || Math.abs(dy) > 5) {
          setIsDragging(true)
        }
      }

      if (isDragging) {
        const newLeft = clientX - offsetRef.current.x
        const newTop = clientY - offsetRef.current.y
        onUpdate(role.id, {
          position: { x: newLeft, y: newTop },
        })
      }
    }

    const handlePressEnd = () => {
      const { startTime, isPressing } = pressStateRef.current
      if (isPressing) {
        const duration = Date.now() - startTime
        if (!isDragging && duration < 200) {
          setIsEditing(true)
          onSelect()
        }
      }
      
      pressStateRef.current.isPressing = false
      setIsDragging(false)
    }

    // --- Event Listeners ---
    const handleMouseDown = (e) => handlePressStart(e.clientX, e.clientY)
    const handleMouseMove = (e) => handlePressMove(e.clientX, e.clientY)
    const handleMouseUp = () => handlePressEnd()

    const handleTouchStart = (e) => {
      e.preventDefault()
      const touch = e.touches[0]
      handlePressStart(touch.clientX, touch.clientY)
    }
    const handleTouchMove = (e) => {
      e.preventDefault()
      const touch = e.touches[0]
      handlePressMove(touch.clientX, touch.clientY)
    }
    const handleTouchEnd = () => handlePressEnd()

    element.addEventListener('mousedown', handleMouseDown)
    window.addEventListener('mousemove', handleMouseMove)
    window.addEventListener('mouseup', handleMouseUp)
    
    element.addEventListener('touchstart', handleTouchStart, { passive: false })
    window.addEventListener('touchmove', handleTouchMove, { passive: false })
    window.addEventListener('touchend', handleTouchEnd)
    window.addEventListener('touchcancel', handleTouchEnd) // Fontos a megszakítások kezelése

    return () => {
      element.removeEventListener('mousedown', handleMouseDown)
      window.removeEventListener('mousemove', handleMouseMove)
      window.removeEventListener('mouseup', handleMouseUp)
      
      element.removeEventListener('touchstart', handleTouchStart)
      window.removeEventListener('touchmove', handleTouchMove)
      window.removeEventListener('touchend', handleTouchEnd)
      window.removeEventListener('touchcancel', handleTouchEnd)
    }
  }, [isDragging, role.position, role.id, onUpdate, isEditing, onSelect])

  const handleSaveEdit = () => {
    const textToSave = editText.trim() || 'Új szerep'
    onUpdate(role.id, { text: textToSave, isEditing: false })
    setIsEditing(false)
  }

  const handleKeyPress = (e) => {
    if (e.key === 'Enter') {
      handleSaveEdit()
    }
    if (e.key === 'Escape') {
      setEditText(role.text)
      setIsEditing(false)
    }
  }

  return (
    <div
      ref={cardRef}
      className={`role-card ${isSelected ? 'selected' : ''} ${isDragging ? 'dragging' : ''}`}
      data-role-id={role.id}
      style={{
        position: 'absolute',
        left: role.position.x + 'px',
        top: role.position.y + 'px',
        borderColor: role.color,
        boxShadow: isSelected ? `0 0 20px ${role.color}40` : 'none',
        cursor: isDragging ? 'grabbing' : isEditing ? 'text' : 'grab',
        userSelect: 'none',
        touchAction: 'none'
      }}
    >
      <div 
        className="role-card-color-indicator"
        style={{ backgroundColor: role.color }}
      />
      
      <div className="role-card-content">
        {isEditing ? (
          <input
            ref={inputRef}
            type="text"
            value={editText}
            onChange={(e) => setEditText(e.target.value)}
            onKeyDown={handleKeyPress}
            onBlur={handleSaveEdit}
            className="role-card-input"
            placeholder="Írj be egy szerepet..."
            onClick={(e) => e.stopPropagation()}
            style={{ cursor: 'text' }}
          />
        ) : (
          <span className="role-card-text">{role.text}</span>
        )}
      </div>
      
      <div className="role-card-actions">
        <button
          className="role-card-action delete"
          onClick={(e) => {
            e.stopPropagation()
            onDelete(role.id)
          }}
        >
          <X size={16} />
        </button>
      </div>
    </div>
  )
}

export default RoleCard