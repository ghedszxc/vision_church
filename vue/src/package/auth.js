import store from '../store/index'
import router from '../router/index'
export default function(Vue) {
  Vue.auth = {
    setToken(token, expiration) {
      localStorage.setItem("token", token);
      localStorage.setItem("expiration", expiration);
      
      sessionStorage.setItem("token", token);
      sessionStorage.setItem("expiration", expiration);
    },

    getToken() {
      let token = sessionStorage.getItem("token") ? sessionStorage.getItem("token") : localStorage.getItem("token")
      let expiration = sessionStorage.getItem("expiration") ? sessionStorage.getItem("expiration") : localStorage.getItem("expiration")

      if (!token || !expiration) return null;

      if (Date.now() > parseInt(expiration)) {
        store.commit('global/SHOW_SNACKBAR',{ snackbar: true, color: "success", message: `Session timeout you are forced to log out, Please log in again` })
        setTimeout(()=>{ router.push('/') },3000)
        this.destoryToken();
        return null;
      } else {
        return token;
      }
    },

    destoryToken() {
      sessionStorage.removeItem("token");
      sessionStorage.removeItem("expiration");

      localStorage.removeItem("token");
      localStorage.removeItem("expiration");
    },

    isAuthenticated() {
      if (this.getToken()) return true;
      else return false;
    }
  };

  Object.defineProperties(Vue.prototype, {
    $auth: {
      get: () => {
        return Vue.auth;
      }
    }
  });
}
