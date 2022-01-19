export const state = () => ({
  articles: [],
})

export const getters = {
  articles: (state) => state.articles,
}

export const mutations = {
  setArticles(state, articles) {
    state.articles = articles
  },
}

export const actions = {
  async fetchArticles({ commit }) {
    const response = await this.$axios.get('api/v1/articles')
    console.log(response.data)
    const data = response.data
    commit('setArticles', data)
  },

  async createArticle(_, params) {
    await this.$axios.post('api/v1/articles', params)
  },
}
