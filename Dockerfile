# Use Node.js as base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Build the react app for production 
RUN npm run build

# Install serve to server static files
RUN npm install -g serve


# Expose the port
EXPOSE 5173

# Run the frontend
CMD ["serve", "-s", "build", "-l", "5173"]
