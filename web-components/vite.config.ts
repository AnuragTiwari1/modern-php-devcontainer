import { defineConfig } from 'vite';

export default defineConfig({
  build: {
    outDir: '../src/public/js',  // Where the built assets go
    rollupOptions: {
      input: 'main.ts',  // Entry point for your frontend code
    }
  },
  server: {
    open: false,  // Don't open the browser automatically
    port: 3000,   // You can use Vite for live development on this port
  }
});