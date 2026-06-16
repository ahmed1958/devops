# Use Node runtime
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all source code
COPY . .

# Expose app port
EXPOSE 4000

# Start server
CMD ["node", "server.js"]