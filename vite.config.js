import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
    base: '/',
    plugins: [vue()],
    server: {
        host: '0.0.0.0',          // allow external access
        port: 5173,               // keep internal container port
        allowedHosts: ['cakrul.my.id', 'localhost', '127.0.0.1']  // add your domain here
    },
    css: {
        preprocessorOptions: {
            scss: {
                silenceDeprecations: ["mixed-decls", "color-functions", "global-builtin", "import"],
            },
        },
    }
})