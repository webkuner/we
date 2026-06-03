# Menggunakan image Node.js dengan Chromium
FROM node:18-alpine

# Install dependencies untuk Puppeteer
RUN apk add --no-cache \
    chromium \
    noto-sans \
    freetype \
    harfbuzz \
    ca-certificates

# Set working directory
WORKDIR /app

# Copy package.json dan package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy seluruh project
COPY . .

# Expose port (jika diperlukan)
EXPOSE 3000

# Start aplikasi
CMD ["node", "bot.js"]
