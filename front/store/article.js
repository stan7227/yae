export const state = () => ({
  articles: [],
  article: {},
})

export const getters = {
  articles: (state) => state.articles,
  article: (state) => state.article,
}

export const mutations = {
  setArticles(state, articles) {
    state.articles = articles
  },

  setArticle(state, article) {
    state.article = article
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

  async fetchArticle({ commit }, id) {
    const response = await this.$axios.get(`api/v1/articles/${id}`)
    const data = response.data

    commit('setArticle', data)
  },
}
