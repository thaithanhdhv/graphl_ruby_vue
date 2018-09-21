import * as mutations from './mutation_types'

export default {
  [mutations.FETCH_AUTHOR] (state, authors) {
    state.authors = authors
  },
  [mutations.CREATED_AUTHOR] (state, author) {
    //set name of newAuthor empty
    state.newAuthor.name = ''
    //add new author to the begining of authors array
    state.authors.unshift(author)
  },
  [mutations.UPDATED_AUTHOR] (state, author) {
    let authorIndex = state.authors.findIndex(_author => _author.id === author.id)
    state.authors.splice(authorIndex, 1)
    state.authors.unshift(author)
  },
  [mutations.DELETED_AU THOR] (state, author) {
    let authorIndex = state.authors.findIndex(_author => _author.id = author.id)
    state.authors.splice(authorIndex,1)
  }
}
