FROM node:20-slim
RUN corepack enable
WORKDIR /app
COPY . .
RUN pnpm install
# Build the app so 'preview' has something to serve
RUN pnpm run build
EXPOSE 5173
# Explicitly point the preview server to the Remix build output directory
CMD ["pnpm", "exec", "vite", "preview", "--outDir", "build/client", "--host", "0.0.0.0", "--port", "5173"]
