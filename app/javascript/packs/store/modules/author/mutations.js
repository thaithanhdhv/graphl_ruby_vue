import * as mutations from './mutation_types'

export default {
  [mutations.FETCH_AUTHOR] (state, authors) {
    state.authors = authors
  },
  [mutations.CREATED_AUTHOR] (state, author) {
    state.newAuthor.name = ''
    state.authors.unshift(author)
  },
  [mutations.UPDATED_AUTHOR] (state, author) {
    let authorIndex = state.authors.findIndex(_author => _author.id === author.id)
    state.authors.splice(authorIndex, 1, author)
  },
  [mutations.DELETED_AUTHOR] (state, author) {
    let authorIndex = state.authors.findIndex(_author => _author.id === author.id)
    state.authors.splice(authorIndex,1)
  }
}
