# Gunakan image khusus untuk Puppeteer (sudah include semua dependencies)
FROM mcr.microsoft.com/playwright/node:20-jammy

WORKDIR /app

# Copy package.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project
COPY . .

# Start bot
CMD ["node", "bot.js"]
