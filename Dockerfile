FROM node:20-slim
RUN corepack enable
WORKDIR /app
COPY . .
RUN pnpm install
# Build the app so 'preview' has something to serve
RUN pnpm run build
EXPOSE 5173
# Use the vite preview binary directly to correctly handle the host and port flags
CMD ["pnpm", "exec", "vite", "preview", "--host", "0.0.0.0", "--port", "5173"]
