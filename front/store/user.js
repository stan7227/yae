export const state = () => ({
  headers: {},
})

export const getters = {
  headers: (state) => state.headers,
}

export const mutations = {
  setHeaders(state, headers) {
    state.headers = headers
  },
}

export const actions = {
  async signUp({ commit }, params) {
    const response = await this.$axios.post('api/v1/auth', params)
    const headers = response.headers
    const loginInfoHeaders = {
      'access-token': headers['access-token'],
      client: headers.client,
      expiry: headers.expiry,
      uid: headers.uid,
      'token-type': headers['token-type'],
    }

    commit('setHeaders', loginInfoHeaders)
  },
}
