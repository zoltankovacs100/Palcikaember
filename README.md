# 🎯 Pálcikaember - Szerepek tisztázása

Modern, mobilbarát webalkalmazás life coaching szerepek vizualizálásához.

## ✨ Jellemzők

- 📱 **Modern mobil UI** - Gyönyörű, intuitív felhasználói felület
- 🎨 **Vizuális szerepkezelés** - Drag & drop szerepkártyák
- 🖌️ **Színválasztó** - 12 előre definiált szín + egyéni színek
- 💾 **PNG export** - Mentsd el a vizualizációt képként
- ⚡ **Gyors és reszponzív** - Optimalizált teljesítmény
- 🌙 **Sötét téma** - Szemkímélő dizájn
- 📲 **PWA ready** - Telepíthető mint mobil app

## 🚀 Használat

### Fejlesztői környezet

```bash
# Függőségek telepítése
npm install

# Fejlesztői szerver indítása
npm run dev
```

Az alkalmazás elérhető lesz: http://localhost:5173

### Build készítése

```bash
# Produkciós build
npm run build

# Build előnézet
npm run preview
```

## 🎮 Funkciók

### Szerepek hozzáadása
- Kattints a jobb alsó sarokban lévő **+** gombra
- Automatikusan létrejön egy új szerepkártya
- Szerkesztheted a nevét és színét

### Szerepek szerkesztése
- **Név módosítása**: Kattints a ceruza ikonra vagy dupla kattintás a kártyán
- **Mozgatás**: Húzd a kártyát a kívánt helyre
- **Szín változtatás**: Használd a bal alsó színválasztót
- **Törlés**: Kattints az X gombra

### Mentés
- Add meg a fájlnevet a felső sávban
- Kattints a **Mentés** gombra
- A vizualizáció PNG formátumban letöltődik

## 🛠️ Technológiák

- **React 18** - Modern UI keretrendszer
- **Vite** - Gyors build tool
- **Framer Motion** - Smooth animációk
- **Lucide React** - Szép ikonok
- **Canvas API** - Rajzolás és export

## 📱 PWA Támogatás

Az alkalmazás Progressive Web App-ként is működik:
- Telepíthető mobilra és asztali gépre
- Offline működés (cache-elés)
- Teljes képernyős mód
- App ikon a kezdőképernyőn

## 🎨 Dizájn

- **Modern glassmorphism** effektek
- **Smooth animációk** minden interakciónál
- **Touch-optimalizált** gesztusok
- **Reszponzív** minden képernyőmérethez

## 📦 Deployment

### Netlify

1. Push a kódot GitHub-ra
2. Kapcsold össze Netlify-jal
3. Build settings:
   - Build command: `npm run build`
   - Publish directory: `dist`

## 🤝 Közreműködés

Örömmel fogadjuk a fejlesztési javaslatokat!

## 📄 Licensz

MIT

---

**Készítette**: Life Coach Academy  
**Verzió**: 2.0.0