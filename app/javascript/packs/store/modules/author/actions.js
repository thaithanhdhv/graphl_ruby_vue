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
    ({data}) => context.commit(mutations.CREATED_AUTHOR, data.data.createAuthor),
    error => console.log(error)
  )
}

export const updateAuthor = (context, author) => {
  let name = prompt('Enter new name', author.name).trim()
  axios.post('/graphql', {
    query: 'mutation {updateAuthor(id: "'+ author.id + '", name: "' + name + '") {id name} }'
  }).then(
    ({data}) => context.commit(mutations.UPDATED_AUTHOR, data.data.updateAuthor),
    error => console.log(error)
  )
}

export const deleteAuthor = (context, author) => {
  axios.post('/graphql', {
    query: 'mutation {deleteAuthor(id: "'+ author.id + '") {id name} }'
  }).then(
    ({data}) => context.commit(mutations.DELETED_AUTHOR, data.data.deleteAuthor),
    error => console.log(error)
  )
}
export default {
  fetchAuthors,
  createAuthor,
  updateAuthor,
  deleteAuthor
}
