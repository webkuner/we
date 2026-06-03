# Gunakan image Node.js resmi + install Puppeteer via npm
FROM node:18-slim

WORKDIR /app

# Copy package.json terlebih dahulu
COPY package*.json ./

# Install dependencies (termasuk puppeteer)
RUN npm install

# Copy seluruh project
COPY . .

# Start bot
CMD ["node", "bot.js"]
