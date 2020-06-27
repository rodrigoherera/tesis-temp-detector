import Vue from "vue";
import Router from "vue-router";
import Home from "./views/Home.vue";

Vue.use(Router);
const router = new Router({
  routes: [
    {
      path: "/",
      name: "home",
      component: Home,
    },
    {
      path: '/main',
      name: 'main',
      component: () => import('./views/Main.vue'),
    },
  ],
})

export default router;
