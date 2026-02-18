FROM node:20-slim
RUN corepack enable
WORKDIR /app
COPY . .
RUN pnpm install
# Build the app so 'preview' has something to serve
RUN pnpm run build
EXPOSE 5173
# Use preview to run the production build on the VPS
CMD ["pnpm", "run", "preview", "--host", "0.0.0.0"]
