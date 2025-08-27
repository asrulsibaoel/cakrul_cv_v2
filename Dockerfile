# -------- Development Stage --------
FROM node:18-alpine AS dev

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 5173

CMD ["npm", "run", "dev"]


# -------- Production Build Stage --------
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build


# -------- Production Run Stage --------
FROM node:18-alpine AS prod

WORKDIR /app

# Install vite globally to run preview
RUN npm install -g vite

# Copy built files
COPY --from=builder /app/dist ./dist

EXPOSE 5173

CMD ["vite", "preview", "--host", "0.0.0.0", "--port", "5173"]
