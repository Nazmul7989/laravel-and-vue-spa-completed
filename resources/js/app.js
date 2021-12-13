import Vue from 'vue';
import VueRouter from 'vue-router';
import {routes} from './router/routes';
import CxltToastr from 'cxlt-vue2-toastr';
import 'cxlt-vue2-toastr/dist/css/cxlt-vue2-toastr.css';
import ObjectToFD from 'vue-object-to-formdata';
// import Swal from 'sweetalert2';
import 'sweetalert2/src/sweetalert2.scss';
import {store} from "./store/store";




require('./bootstrap');

Vue.use(VueRouter);
Vue.use(CxltToastr);
Vue.use(ObjectToFD);

//Vue pagination
Vue.component('pagination', require('laravel-vue-pagination'));


//Vue Toastr notification start here
var toastrConfigs = {
    position: 'top right',
    closeButton: true,
    showMethod: 'fadeIn',
    hideMethod: 'fadeOut',
    showDuration: 1000,
    timeOut: 5000

}
Vue.use(CxltToastr, toastrConfigs);
//Vue Toastr notification end here

//Creating router start here
const router = new VueRouter({
    // routes: routes,
    routes,
    mode: 'history'
    // linkExactActiveClass: 'active'
})
//Creating Router end here

//Navigation guard start here
// function isLoggedin(){
//     return store.getters.getAuthentication
// }
//
// router.beforeEach((to, from, next)=>{
//     if (to.matched.some(record => record.meta.requiresAuth)){
//         if (!isLoggedin()){
//             next({name: 'login'})
//             // router.push({name: 'login'})
//             // router.push('/login').catch(()=>{})
//         }else {
//             next()
//         }
//     } else if (to.matched.some(record => record.meta.requiresVisitor)){
//         if (isLoggedin()){
//             next({name: 'dashboard'})
//             // router.push({name: 'dashboard'})
//             // router.push('/dashboard').catch(()=>{})
//         }else {
//             next()
//         }
//     }else {
//         next()
//     }
// })
//Navigation guard end here

Vue.component('app-header', require('./components/pages/partial/header').default);

//Check authentication for local storage
let auth = localStorage.getItem('auth');

if (auth){
    store.dispatch('authUser').then(()=>{
        const app = new Vue({
            el: '#app',
            // router: router
            router,
            store

        });
    })
}else {
    const app = new Vue({
        el: '#app',
        // router: router
        router,
        store

    });
}


// const app = new Vue({
//     el: '#app',
//     // router: router
//     router,
//     store
//
// });

