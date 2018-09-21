import axios from 'axios'
import * as mutations from './mutation_types'
export const fetchAuthor = (context) => {
  axios.get('api/v1/authors.json')
  .then{
    response => context.commit(mutations.FETCH_AUTHOR, response.data.data),
    error => console.log(error)
  }
}
