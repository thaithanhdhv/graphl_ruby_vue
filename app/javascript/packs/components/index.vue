
<template>
  <div>
    <div v-for="a in authors" class="abc">
      {{a.id}}
    </div>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  data: function(){
    return {
      authors: null
    }
  },
  mounted () {
    axios.get('api/v1/authors.json')
      .then(
        response => this.authors = response.data.data ,
        error => console.log(error)
      )
  }
}
</script>

<style lang="css">
</style>
