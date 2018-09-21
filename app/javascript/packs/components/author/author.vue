
<template>
  <li>
    User Name : {{author.name}} - ID: {{author.id}}
    <button class="btn btn-link" @click = "deleteAuthor(author)">Delete</button>
    <button class="btn btn-link" @click = "updateAuthor(author)">Update</button>
  </li>
</template>
<script>
import axios from 'axios'
export default {
  props: ['author'],
  data() {
    return {}
  },
  mounted() {
    axios.post('/graphql', {
      query: '{ allAuthors{ id name} }'
    }).then(
      ({data}) => {this.authors = data.data.allAuthors},
      error => console.log(error)
    )
  },
  methods: {
    createAuthor(author) {
      axios.post('/graphql', {
        query: 'mutation {createAuthor(name: "'+ author.name + '") {id name} }'
      }).then(
        ({data}) => {
          this.authors.push(data.data.createAuthor)
          this.newAuthor.name = ''
        },
        error => console.log(error)
      )
    },
    deleteAuthor(author){
      let authorIndex = this.authors.findIndex(_author => _author.id === author.id)
      console.log(authorIndex)
      axios.post('/graphql', {
        query: 'mutation {deleteAuthor(id: "'+ author.id + '") {id name} }'
      }).then(
        ({data}) => {
          this.authors.splice(authorIndex,1)
        },
        error => console.log(error)
      )
    },
    updateAuthor(author){
      let name = prompt('Enter new name', author.name).trim()
      let authorIndex = this.authors.findIndex(_author => _author.id === author.id)
      axios.post('/graphql', {
        query: 'mutation {updateAuthor(id: "'+ author.id + '", name: "' + name + '") {id name} }'
      }).then(
        ({data}) => {
          this.authors.splice(authorIndex,1, data.data.updateAuthor)
        },
        error => console.log(error)
      )
    },
    resetData() {
      this.newAuthor.name = ''
      this.isUpdate = false
    }
  }
}
</script>

<style lang="css">
</style>
