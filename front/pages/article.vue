<template>
  <form id="writing-article" :class="$style.article_form">
    <h2 :class="$style.h2">現場登録</h2>
    <v-text-field
      v-model="title"
      outlined
      single-line
      name="title"
      placeholder="現場名"
      :class="$style.title_form"
    ></v-text-field>
    <div :class="$style.edit_area">
      <v-textarea
        v-model="body"
        outlined
        no-resize
        hide-details
        height="100%"
        name="body"
        placeholder="現場の内容を入力してください"
        class="body-form"
      ></v-textarea>
    </div>
    <div :class="$style.create_btn_area">
      <v-btn
        color="#66cdaa"
        :loading="loading"
        class="font-weight-bold white--text"
        @click="createArticle"
        >登録
      </v-btn>
    </div>
  </form>
</template>

<script>
export default {
  middleware: 'authed',
  data() {
    return {
      id: '',
      title: '',
      body: '',
      loading: false,
    }
  },
  methods: {
    async createArticle() {
      this.loading = true
      const params = {
        title: this.title,
        body: this.body,
      }
      try {
        await this.$store.dispatch('article/createArticle', params)
        this.$router.push('/')
      } catch (err) {
        alert(err.response.data.errors.full_messages)
      } finally {
        this.loading = false
      }
    },
  },
}
</script>
<style lang="scss" module>
.h2 {
  text-align: center;
  padding: 10px;
  font-size: 20px;
  font-family: Comic Sans MS;
  color: dimgray;
}
.article_form {
  margin: 10px auto 0;
  padding: 30px 30px;
  height: calc(100% - 64px - 10px);
  display: flex;
  flex-flow: column;
  width: 80%;
}

.title_form {
  flex: none;
  background: #fff;
}

.edit_area {
  height: 100%;
  display: flex;
  overflow: hidden;
  background: #fff;
  margin-bottom: 10px;
}

.create_btn_area {
  text-align: right;
}
</style>

<style lang="scss">
#writing-article {
  body-form > .v-text-field fieldset,
  .v-text-field .v-input__control {
    height: 100%;
  }
}
</style>
