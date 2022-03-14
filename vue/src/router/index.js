import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '@/components/Login.vue'
import Index from '@/components/globalLayouts/Index.vue'
import Dashboard from '@/components/dashboard/Index.vue'
import Calendar from '@/components/calendar/Index.vue'
import Report from '@/components/report/Index.vue'
Vue.use(VueRouter)
const routes = [
  {
    path: '/login',
    component: Login
  },
  {
    path: '/',
    component: Index,
    children: [
      {
        path: '/dashboard',
        component: Dashboard,
      },
      {
        path: '/calendar',
        component: Calendar,
      },
      {
        path: '/report',
        component: Report,
      },
    ]
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
