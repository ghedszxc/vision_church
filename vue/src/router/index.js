import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '@/components/Login.vue'
import Index from '@/components/globalLayouts/Index.vue'
import Dashboard from '@/components/dashboard/Index.vue'
import Calendar from '@/components/calendar/Index.vue'
import Disciple from '@/components/report/Index.vue'
import User from '@/components/userManagement/Index.vue'

import PageNotFound from '@/components/globalLayouts/PageNotFound.vue'
Vue.use(VueRouter)
const routes = [
  {
    path: '/',
    component: Login,
    meta: {
      forVisitors: true
    }
  },
  {
    path: '/',
    component: Index,
    meta: {
      forAuth: true
    },
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
        path: '/disciple',
        component: Disciple,
      },
      {
        path: '/user',
        component: User,
      },
    ]
  },
  { path: "*", component: PageNotFound }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
