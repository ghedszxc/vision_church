import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import router from './router'
import store from './store'
import vueResource from 'vue-resource'

Vue.use(vueResource)
Vue.http.options.root = "http://127.0.0.1:8000"
Vue.config.productionTip = false

new Vue({
  vuetify,
  router,
  store,
  render: h => h(App)
}).$mount('#app')
