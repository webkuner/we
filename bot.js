const puppeteer = require('puppeteer');

async function visitWebsite() {
  let browser;
  
  try {
    // Launch Puppeteer dengan opsi untuk Docker
    browser = await puppeteer.launch({
      headless: true,
      args: [
        '--no-sandbox',
        '--disable-setuid-sandbox',
        '--disable-dev-shm-usage',
        '--disable-gpu',
      ],
      executablePath: process.env.PUPPETEER_EXECUTABLE_PATH || '/usr/bin/chromium',
    });
    // Buka page baru
    const page = await browser.newPage();

    // Set viewport
    await page.setViewport({
      width: 1280,
      height: 720,
    });

    // Navigate ke website
    console.log('Opening website: dagnon-one-bay.vercel.app...');
    await page.goto('https://dagnon-one-bay.vercel.app', {
      waitUntil: 'networkidle2',
    });

    console.log('Website loaded successfully!');

    // Stay di website - bisa tambah logika di sini
    // Contoh: scroll, click, input, atau monitoring
    
    // Option 1: Stay indefinitely (jika pakai restart policy di Docker)
    console.log('Bot is staying on the website...');
    
    // Take screenshot
    await page.screenshot({ path: 'website-screenshot.png' });
    console.log('Screenshot saved as website-screenshot.png');

    // Monitoring page untuk perubahan/events
    page.on('error', (err) => console.error('Page error:', err));
    page.on('close', () => console.log('Page closed'));

    // Keep browser open
    setInterval(() => {
      console.log('[' + new Date().toLocaleString() + '] Still monitoring...');
    }, 60000); // Log setiap 1 menit

  } catch (error) {
    console.error('Error:', error);
    process.exit(1);
  }
}

// Run bot
visitWebsite();
