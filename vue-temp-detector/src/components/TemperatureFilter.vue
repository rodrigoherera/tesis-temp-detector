<template>
  <div class="box">
    <div class="container">
      <label for="persons">Employee </label>
      <select v-model="employee">
        <option v-for="user in users" v-bind:key="user.id" v-bind:value="user.id">
          {{ user.id + " " + user.name + " " +user.lastname }}
        </option>
      </select>
      <label for="from">Date from </label>
      <input type="date" id="from" v-model="dateFrom">
      <label for="to">Date to </label>
      <input type="date" id="to" v-model="dateTo">
    </div>
    <div class="btn">
      <a href="#" @click=filter>Filter</a>
    </div>
    <div class="btn">
      <a href="#" @click=clearFilters>Clean filters</a>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import Component from 'vue-class-component';
import users from '@/store/modules/User';
import { IFilters } from '../store/models';
import temperatures from '@/store/modules/Temperature';

@Component({
  name: "TemperatureFilter",
})
export default class TemperatureFilter extends Vue {
  employee = "0";
  dateTo = "";
  dateFrom = "";

  clearFilters() {
    this.employee= "0";
    this.dateTo = "";
    this.dateFrom = "";
  }

  filter() {
    const temp: IFilters = {userId: 0, dateFrom: "", dateTo : ""};
    if (this.employee == ""){
      temp.userId = 0;
    } else {
      temp.userId = parseInt(this.employee);
    }
    if (this.dateTo != "" || this.dateFrom != "") {
      if (this.dateTo != "") {
        temp.dateTo = this.dateTo + " 23:59:59";
      }
      if (this.dateFrom != "") {
        temp.dateFrom = this.dateFrom + " 23:59:59";
      }
    }
    this.goFilter(temp);
  }

  goFilter(temp: IFilters) {
    temperatures.GetTemperaturesWithFilter(temp)
  }

  get users() {
    return users.Users;
  }

  created() {
    return users.Users
  }
} 
</script>

<style lang="scss" scoped>
  .box {
    height: 180px;
    border: 1px solid red;
    margin-top: 10px;
    margin-bottom: 10px;
    padding-top: 10px;
    padding-right: 10px;
    padding-left: 10px;
    .container {
      padding: 0;
      margin: 0;
      display: flex;
      flex-direction: column;
      color: #fff;
      input {
        clear: both;
        width: 100%;
      }
    }
    .btn {
      display: inline-block;
      transition: all 0.5s;
      text-decoration: none;
      border: none;
      cursor: pointer;
      border-radius: 10px;
      padding: 0.1rem .9rem;
      color: #fff;
      background-color: grey;
      font-size: 1rem; 
      margin-top: 10px;
      margin-left: 5px;
      margin-right: 5px;
      margin-bottom: 10px;
      &:hover {
        background-color: #ff002b;
      }
      a {
        color: #fff;
        text-decoration: none;
        text-align: center;
      }
    }
  }
</style>