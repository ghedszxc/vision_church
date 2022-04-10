import store from '../store/index'
import router from '../router/index'

export default function(Vue) {
  Vue.auth = {
    setToken(auth, expiration) {
      sessionStorage.setItem("token", auth.token)
      sessionStorage.setItem("username", auth.user.username)
      sessionStorage.setItem("expiration", expiration)
    },

    getToken() {
      let token = sessionStorage.getItem("token") ? sessionStorage.getItem("token") : null
      let expiration = sessionStorage.getItem("expiration") ? sessionStorage.getItem("expiration") : null

      if (!token || !expiration) return null

      if (Date.now() > parseInt(expiration)) {
        store.commit('global/SHOW_SNACKBAR',{ snackbar: true, color: "success", message: `Session timeout you are forced to log out, Please log in again` })
        setTimeout(() => { router.push('/') },3000)
        this.destoryToken()
        return null
      } else {
        return token
      }
    },

    destoryToken() {
      sessionStorage.removeItem("token")
      sessionStorage.removeItem("username")
      sessionStorage.removeItem("expiration")
    },

    isAuthenticated() {
      if (this.getToken()) return true
      else return false
    }
  };
}

