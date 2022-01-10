import createPersistedState from 'vuex-persistedstate'
import Cookies from 'js-cookie'
import cookie from 'cookie'

const COOKIE_TARGET_STORE = ['user']

export default ({ store, req, isDev }) => {
  createPersistedState({
    key: 'docker_wonderful',
    paths: COOKIE_TARGET_STORE,
    storage: {
      getItem: (key) =>
        process.client
          ? Cookies.get(key)
          : cookie.parse(req.headers.cookie)[key],
      setItem: (key, value) => {
        const cookie = Cookies.set(key, value, {
          expires: 14,
          secure: !isDev,
          sameSite: 'lax',
        })
        return cookie
      },
      removeItem: (key) => Cookies.remove(key),
    },
  })(store)
}
