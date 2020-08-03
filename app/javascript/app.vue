<template>
  <div id="app">
    <b-container fluid>
      <router-view router-view></router-view>
    </b-container>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
