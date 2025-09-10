# Use official Node.js image
FROM node:20

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your code
COPY . .

# Expose the port (change if your server uses a different port)
EXPOSE 8000

# Start the server (update if your entry point is not index.js)
CMD ["node", "server/http-server.js"]