import { useEffect, useRef, forwardRef, useImperativeHandle } from 'react'
import jsPDF from 'jspdf'
import html2canvas from 'html2canvas'
import './StickmanCanvas.css'

const StickmanCanvas = forwardRef(({ roles, selectedRole }, ref) => {
  const canvasRef = useRef(null)
  const animationRef = useRef(null)
  const centerRef = useRef({ x: 0, y: 0 })

  useImperativeHandle(ref, () => ({
    exportPdf: (fileName) => {
      const appElement = document.querySelector('.app-container')
      if (!appElement) return

      html2canvas(appElement, {
        useCORS: true,
        scale: 2,
        backgroundColor: '#FFFFFF',
        logging: false,
      }).then(canvas => {
        const imgData = canvas.toDataURL('image/png')
        
        // A4 méretek (mm): 210 x 297
        const pdf = new jsPDF({
          orientation: 'portrait',
          unit: 'mm',
          format: 'a4'
        })
        
        const pdfWidth = pdf.internal.pageSize.getWidth()
        const pdfHeight = pdf.internal.pageSize.getHeight()
        
        const canvasAspectRatio = canvas.width / canvas.height
        const pdfAspectRatio = pdfWidth / pdfHeight
        
        let finalWidth, finalHeight
        if (canvasAspectRatio > pdfAspectRatio) {
          finalWidth = pdfWidth
          finalHeight = pdfWidth / canvasAspectRatio
        } else {
          finalHeight = pdfHeight
          finalWidth = pdfHeight * canvasAspectRatio
        }

        const x = (pdfWidth - finalWidth) / 2
        const y = (pdfHeight - finalHeight) / 2

        pdf.addImage(imgData, 'PNG', x, y, finalWidth, finalHeight)

        // Időbélyeg
        const timestamp = new Date().toLocaleString('hu-HU')
        pdf.setFontSize(8)
        pdf.setTextColor(150)
        pdf.text(timestamp, pdfWidth / 2, pdfHeight - 10, { align: 'center' })
        
        pdf.save(`${fileName}.pdf`)
      })
    }
  }))

  const drawStickman = (ctx, center) => {
    const scale = Math.min(window.innerWidth, window.innerHeight) / 500
    const headRadius = 25 * scale
    const bodyLength = 80 * scale
    
    // Head - FEKETE
    ctx.strokeStyle = '#000000'
    ctx.lineWidth = 3 * scale
    ctx.beginPath()
    ctx.arc(center.x, center.y - bodyLength/2, headRadius, 0, Math.PI * 2)
    ctx.stroke()
    
    // Eyes - FEKETE
    ctx.fillStyle = '#000000'
    ctx.beginPath()
    ctx.arc(center.x - 8*scale, center.y - bodyLength/2 - 5*scale, 3*scale, 0, Math.PI * 2)
    ctx.arc(center.x + 8*scale, center.y - bodyLength/2 - 5*scale, 3*scale, 0, Math.PI * 2)
    ctx.fill()
    
    // Smile - FEKETE
    ctx.strokeStyle = '#000000'
    ctx.lineWidth = 2 * scale
    ctx.beginPath()
    ctx.arc(center.x, center.y - bodyLength/2 + 5*scale, 12*scale, 0.2 * Math.PI, 0.8 * Math.PI)
    ctx.stroke()
    
    // Body - FEKETE
    ctx.strokeStyle = '#000000'
    ctx.lineWidth = 3 * scale
    ctx.beginPath()
    ctx.moveTo(center.x, center.y - bodyLength/2 + headRadius)
    ctx.lineTo(center.x, center.y + bodyLength/2)
    ctx.stroke()
    
    // Arms - FEKETE
    ctx.beginPath()
    ctx.moveTo(center.x - 40*scale, center.y - 10*scale)
    ctx.lineTo(center.x + 40*scale, center.y - 10*scale)
    ctx.stroke()
    
    // Legs - FEKETE
    ctx.beginPath()
    ctx.moveTo(center.x, center.y + bodyLength/2)
    ctx.lineTo(center.x - 30*scale, center.y + bodyLength/2 + 50*scale)
    ctx.moveTo(center.x, center.y + bodyLength/2)
    ctx.lineTo(center.x + 30*scale, center.y + bodyLength/2 + 50*scale)
    ctx.stroke()
  }

  const drawConnections = (ctx, center, roles) => {
    roles.forEach(role => {
      // Keressük meg a DOM elemet az id alapján
      const roleElement = document.querySelector(`[data-role-id="${role.id}"]`)
      if (!roleElement) return
      
      const rect = roleElement.getBoundingClientRect()
      const canvasRect = ctx.canvas.getBoundingClientRect()
      
      // Számoljuk ki a pontos pozíciót a canvas koordináta rendszerében
      const roleX = rect.left - canvasRect.left + rect.width / 2
      const roleY = rect.top - canvasRect.top + rect.height / 2
      
      const dx = roleX - center.x
      const dy = roleY - center.y
      const dist = Math.sqrt(dx*dx + dy*dy)
      
      if (dist > 0) {
        // A pálcikaembertől induló pont (a teste széléről)
        const fromX = center.x + (dx/dist) * 40
        const fromY = center.y + (dy/dist) * 40
        
        // A szerepkártya széléig (ne a közepéig)
        const toX = roleX - (dx/dist) * (rect.width / 2)
        const toY = roleY - (dy/dist) * (rect.height / 2)
        
        // Gradient line
        const gradient = ctx.createLinearGradient(fromX, fromY, toX, toY)
        gradient.addColorStop(0, role.color + '60')
        gradient.addColorStop(1, role.color)
        
        ctx.strokeStyle = gradient
        ctx.lineWidth = 3
        ctx.lineCap = 'round'
        ctx.beginPath()
        ctx.moveTo(fromX, fromY)
        ctx.lineTo(toX, toY)
        ctx.stroke()
        
        // Connection point at role card
        ctx.fillStyle = role.color
        ctx.beginPath()
        ctx.arc(toX, toY, 4, 0, Math.PI * 2)
        ctx.fill()
      }
    })
  }

  const drawRoleBoxes = (ctx, roles) => {
    roles.forEach(role => {
      const roleElement = document.querySelector(`[data-role-id="${role.id}"]`)
      if (!roleElement) {
        // Fallback ha nincs DOM elem (export esetén)
        ctx.fillStyle = '#FFFFFF'
        ctx.fillRect(role.position.x, role.position.y, 120, 60)
        ctx.strokeStyle = role.color
        ctx.lineWidth = 2
        ctx.strokeRect(role.position.x, role.position.y, 120, 60)
        ctx.fillStyle = '#111827'
        ctx.font = '16px -apple-system, BlinkMacSystemFont, sans-serif'
        ctx.textAlign = 'center'
        ctx.textBaseline = 'middle'
        ctx.fillText(role.text, role.position.x + 60, role.position.y + 30)
        return
      }
      
      const rect = roleElement.getBoundingClientRect()
      const canvasRect = ctx.canvas.getBoundingClientRect()
      
      const boxX = rect.left - canvasRect.left
      const boxY = rect.top - canvasRect.top
      
      // Box background - FEHÉR
      ctx.fillStyle = '#FFFFFF'
      ctx.fillRect(boxX, boxY, rect.width, rect.height)
      
      // Box border
      ctx.strokeStyle = role.color
      ctx.lineWidth = 2
      ctx.strokeRect(boxX, boxY, rect.width, rect.height)
      
      // Text - FEKETE (jobb kontraszt)
      ctx.fillStyle = '#111827'
      ctx.font = '14px -apple-system, BlinkMacSystemFont, sans-serif'
      ctx.textAlign = 'center'
      ctx.textBaseline = 'middle'
      ctx.fillText(role.text, boxX + rect.width/2, boxY + rect.height/2)
    })
  }

  const draw = () => {
    const canvas = canvasRef.current
    if (!canvas) return
    
    const ctx = canvas.getContext('2d')
    const width = window.innerWidth
    const height = window.innerHeight
    
    canvas.width = width
    canvas.height = height
    
    // Update center
    centerRef.current = {
      x: width / 2,
      y: height / 2 - 50
    }
    
    // Clear and draw WHITE background
    ctx.fillStyle = '#FFFFFF'
    ctx.fillRect(0, 0, width, height)
    
    // Draw stickman and connections
    drawStickman(ctx, centerRef.current)
    drawConnections(ctx, centerRef.current, roles)
  }

  useEffect(() => {
    const animate = () => {
      draw()
      animationRef.current = requestAnimationFrame(animate)
    }
    
    // Kis késleltetés, hogy a DOM elemek biztosan renderelődjenek
    const timeoutId = setTimeout(() => {
      animate()
    }, 100)
    
    const handleResize = () => draw()
    window.addEventListener('resize', handleResize)
    
    return () => {
      clearTimeout(timeoutId)
      if (animationRef.current) {
        cancelAnimationFrame(animationRef.current)
      }
      window.removeEventListener('resize', handleResize)
    }
  }, [roles])

  return <canvas ref={canvasRef} className="stickman-canvas" />
})

StickmanCanvas.displayName = 'StickmanCanvas'

export default StickmanCanvas
