import { createApp } from 'vue'

import App from './App.vue'
import router from './router'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import gojs from 'gojs'
import VueRouter from 'vue-router'

const app = createApp(App)
app.use(router)
app.use(ElementPlus)
app.config.globalProperties.go = gojs
app.mount('#app')
