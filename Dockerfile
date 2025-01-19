# Use an official node.js runtime as a parent image
FROM node:22-alpine

# Set the working directory in the container
WORKDIR /app

#Copy the package.json and the package-lock.json intothe container
COPY package*.json .

# Install the dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Run prisma generate
RUN npx prisma generate

# Expose the port that the app runs on
EXPOSE 5500

# Define the command to run the aplication
CMD ["node", "./src/index.js"]