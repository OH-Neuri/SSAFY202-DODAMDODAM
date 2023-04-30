# FROM node:19
# WORKDIR /react
# COPY . .
# RUN npm install -g serve
# CMD serve -s build

# Base image
FROM node:19-alpine

# Set working directory
WORKDIR /react

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build React app
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Start server
CMD ["npm", "start"]
