import Vue from "vue";
import Router from "vue-router";
import Home from "./views/Home.vue";
import NProgress from 'nprogress';

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

router.beforeResolve((to, from, next) => {
  if (to.name) {
    NProgress.start();
  }
  next()
})

router.afterEach((to, from) => {
  NProgress.done()
})

export default router;
