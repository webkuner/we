# Menggunakan image Node.js dengan Debian (sudah include dependencies)
FROM node:18-bullseye-slim

# Install dependencies untuk Puppeteer
RUN apt-get update && apt-get install -y \
    chromium-browser \
    ca-certificates \
    fonts-noto \
    libfreetype6 \
    libharfbuzz0b \
    wget \
    && rm -rf /var/lib/apt/lists/*

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
