import home from '../components/pages/home';
import category from '../components/pages/category/index'
import createCategory from "../components/pages/category/create";
import editCategory from "../components/pages/category/edit";
import product from "../components/pages/product/index";
import createProduct from "../components/pages/product/create";
import editProduct from "../components/pages/product/edit";
import show from "../components/pages/product/show";
import login from "../components/pages/auth/login";
import register from "../components/pages/auth/register";
import dashboard from "../components/pages/user/dashboard";
import profile from "../components/pages/user/profile";
import notFound from "../components/pages/notFound";
import {store} from "../store/store";



export const routes = [
    {
        path: '/',
        component: home,
        name: 'home'
    },
    {
        path: '/category',
        component: category,
        name: 'category',
        beforeEnter: (to,from,next) => {
            if(store.state.authentication === false){
                // next(false)
                return next({
                    name: 'login'
                })
            }else {
                next()
            }
        }
    },
    {
        path: '/category/create',
        component: createCategory,
        name: 'create-category',
        beforeEnter: (to,from,next) => {
            if(store.state.authentication === false){
                // next(false)
                return next({
                    name: 'login'
                })
            }else {
                next()
            }
        }
    },
    {
        path: '/category/edit/:id',
        component: editCategory,
        name: 'edit-category',
        beforeEnter: (to,from,next) => {
            if(store.state.authentication === false){
                // next(false)
                return next({
                    name: 'login'
                })
            }else {
                next()
            }
        }
    },

    //product route start

    {
        path: '/product',
        component: product,
        name: 'product',
        beforeEnter: (to,from,next) => {
            if(store.state.authentication === false){
                // next(false)
                return next({
                    name: 'login'
                })
            }else {
                next()
            }
        }
    },
    {
        path: '/product/create',
        component: createProduct,
        name: 'create-product',
        beforeEnter: (to,from,next) => {
            if(store.state.authentication === false){
                // next(false)
                return next({
                    name: 'login'
                })
            }else {
                next()
            }
        }
    },
    {
        path: '/product/edit/:id',
        component: editProduct,
        name: 'edit-product',
        beforeEnter: (to,from,next) => {
            if(store.state.authentication === false){
                // next(false)
                return next({
                    name: 'login'
                })
            }else {
                next()
            }
        }
    },
    {
        path: '/product/show/:id',
        component: show,
        name: 'show-product'
    },

    //Login && Register route start here
    {
        path: '/login',
        component: login,
        name: 'login',
        // meta: {
        //     requiresVisitor: true
        // }
        beforeEnter: (to,from,next) => {
            if(store.state.authentication === true){
                // next(false)
                return next({
                            name: 'dashboard'
                        })
            }else {
                next()
            }
        }
    },
    {
        path: '/register',
        component: register,
        name: 'register'
    },
    {
        path: '/dashboard',
        component: dashboard,
        name: 'dashboard',
        // meta: {
        //     requiresAuth: true
        // }
        beforeEnter: (to,from,next) => {
            if(store.state.authentication === false){
                // next(false)
                return next({
                            name: 'login'
                        })
            }else {
                next()
            }
        }
    },
    {
        path: '/profile',
        component: profile,
        name: 'profile',
        beforeEnter: (to,from,next) => {
            if(store.state.authentication === false){
                // next(false)
                return next({
                    name: 'login'
                })
            }else {
                next()
            }
        }
    },
    {
        path: '*',
        component: notFound,
    }

]


