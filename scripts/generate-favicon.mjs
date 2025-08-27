import { readFile, writeFile } from 'fs/promises'
import pngToIco from 'png-to-ico'

const src = new URL('../public/vista-verde-192.png', import.meta.url)
const dst = new URL('../public/favicon.ico', import.meta.url)

try {
	const buf = await readFile(src)
	const ico = await pngToIco(buf)
	await writeFile(dst, ico)
	console.log('favicon.ico generated successfully')
} catch (err) {
	console.error('Failed to generate favicon.ico:', err)
	process.exit(1)
}
