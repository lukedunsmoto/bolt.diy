FROM node:20-slim
RUN corepack enable
WORKDIR /app
COPY . .
RUN pnpm install
# Build the app so 'preview' has something to serve
RUN pnpm run build
EXPOSE 5173
# Use the compiled Remix production server
CMD ["pnpm", "run", "dockerstart"]
