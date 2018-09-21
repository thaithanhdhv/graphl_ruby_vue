import axios from 'axios'
import * as mutations from './mutation_types'


export const fetchAuthors = (context) => {
  axios.post('/graphql',{
    query: '{ allAuthors{ id name} }'
  })
  .then(
    ({data}) => context.commit(mutations.FETCH_AUTHOR, data.data.allAuthors),
    error => console.log(error)
  )
}

export const createAuthor  = (context, author) => {
  axios.post('/graphql', {
    query: 'mutation {createAuthor(name: "'+ author.name + '") {id name} }'
  }).then(
    ({data}) => context.commit(mutation.CREATED_AUTHOR, data.data.createAuthor),
    error => console.log(error)
  )
}

export const updateAuthor = (context, author) => {
  let name = prompt('Enter new name', author.name).trim()
  let authorIndex = this.authors.findIndex(_author => _author.id === author.id)
  axios.post('/graphql', {
    query: 'mutation {updateAuthor(id: "'+ author.id + '", name: "' + name + '") {id name} }'
  }).then(
    ({data}) => context.commit(mutation.UPDATE_AUTHOR, data.data.updateAuthor),
    error => console.log(error)
  )
}

export const deleteAuthor = (context, author) => {
  let authorIndex = this.authors.findIndex(_author => _author.id === author.id)
  console.log(authorIndex)
  axios.post('/graphql', {
    query: 'mutation {deleteAuthor(id: "'+ author.id + '") {id name} }'
  }).then(
    ({data}) => context.commit(mutation.DELETED_AUTHOR, data.data.deleteAuthor),
    error => console.log(error)
  )
}
export default {
  fetchAuthors,
  createAuthor,
  updateAuthor,
  deleteAuthor
}
