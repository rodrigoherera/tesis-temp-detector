<template>
  <div class="temp">
    <div class="filter-person">
      <label for="persons">Person</label>
      <select name="person" id="person">
        <option value="all">All</option>
      </select>
    </div>
    <div class="filter-date">
      <label for="date">Date</label>
      <div>
        <label for="from">Date from</label>
        <input type="date" id="from">
      </div>
      <div>
        <label for="to">Date to</label>
        <input type="date" id="to">
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
  
})
</script>

<style lang="scss" scoped>

</style>