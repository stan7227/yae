<template>
  <v-container class="elevation-3" :class="$style.article_container">
    <template v-if="isInitialized">
      <div :class="$style.article_layout">
        <div :class="$style.name_area">
          <span>@{{ article.user.name }}</span>
        </div>
        <h1 :class="$style.article_title">{{ article.title }}</h1>
        <div :class="$style.article_body_container">
          <div :class="$style.article_body">
            <p>{{ article.body }}</p>
          </div>
        </div>
      </div>
    </template>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      isInitialized: false,
    }
  },

  computed: {
    article() {
      return this.$store.getters['article/article']
    },
  },

  async created() {
    const articleId = this.$route.params.id

    try {
      await this.$store.dispatch('article/fetchArticle', articleId)
      this.isInitialized = true
    } catch (err) {
      alert(err.response.statusText)
    }
  },
}
</script>

<style lang="scss" module>
.article_container {
  margin-top: 30px;
  background: #fff;
  margin-bottom: 20px;
  width: 60%;
}
.article_layout {
  margin: 0 20px;
}
.name_area {
  margin-bottom: 16px;
}
.article_title {
  font-size: 40px;
  line-height: 1.5;
}
.article_body_container {
  margin: 36px 0;
  font-size: 16px;
}
.article_body {
  width: 100%;
}
</style>
