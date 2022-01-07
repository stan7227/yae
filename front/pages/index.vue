<template>
  <div>{{ articles }}</div>
</template>

<script>
export default {
  computed: {
    articles() {
      return this.$store.getters['article/articles']
    },
  },

  async created() {
    try {
      await this.$store.dispatch('article/fetchArticles')
    } catch (err) {
      alert(err.response.statusText)
    }
  },
}
</script>
