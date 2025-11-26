# Base image
FROM node:22-slim

# Set working directory to project root
WORKDIR /

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Install Playwright with Chromium and dependencies
RUN npx playwright install --with-deps chromium

# Copy project content
COPY . .

# Default command to run tests
CMD ["npx", "playwright", "test"]