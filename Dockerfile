# Use Node.js as the base image
FROM node:20

# Create an app directory
RUN mkdir -p /app

# Set the working directory inside the container
WORKDIR /app

# Copy application into the container
COPY . .

# Install dependencies
RUN npm install --omit=dev

# Generate Database
RUN npx prisma migrate dev --name init

# Build the Next.js application
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "start"]
