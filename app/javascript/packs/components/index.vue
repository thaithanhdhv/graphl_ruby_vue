<template lang="html">
  <div>
    <h2>Home</h2>
    <ul v-for="author in authors">
      <app-author :author= "author" :key="author.id"></app-author>
    </ul>

    <div>
      <h4>Create new Author</h4>
      <div class="form-group">
        <label for="author-name">Name</label>
        <br>
        <input type="text" v-model = "newAuthor.name" class="author-name">
      </div>
      <button @click= "createAuthor(newAuthor)" class="btn btn-primary">Create</button>
    </div>

  </div>
</template>

<script>
import Author from './author/author.vue'
import axios from 'axios'
import {mapGetters, mapActions, mapState} from 'vuex'

export default {
  components: {
    appAuthor: Author
  },
  data: function() {
    return {}
  },
  mounted() {
    this.fetchAuthors()
  },
  computed: {
    ...mapState('author', [
      'authors',
      'newAuthor'
    ])
  },
  methods: {
    ...mapActions('author',[
      'fetchAuthors',
      'createAuthor',
      'updateAuthor',
      'deleteAuthor'
    ])
  }
}
</script>

<style lang="css">
</style>
