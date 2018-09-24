
<template>
  <li>
    User Name : {{author.name}} - ID: {{author.id}}
    <button class="btn btn-link" @click="firedeleteAuthor(author)">Delete</button>
    <button class="btn btn-link" @click="fireupdateAuthor(author)">Update</button>
  </li>
</template>
<script>
import axios from 'axios'
export default {
  props: ['author'],
  data() {
    return {}
  },
  methods: {
    firedeleteAuthor: function(author) {
      this.$emit('delete-author',author)
    },
    fireupdateAuthor: function(author) {
      this.$emit('update-author', author)
    }
  }
}
</script>

<style lang="css">
</style>
