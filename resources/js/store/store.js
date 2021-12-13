import Vue from 'vue'
import Vuex from 'vuex'
import {routes} from "../router/routes";
import axios from "axios";

Vue.use(Vuex)

export const store = new Vuex.Store({
    state: {
        msg: 'Welcome to Dashboard',
        user:  {},
        authentication: false
    },
    getters: {
        getMessage(state){
            return state.msg
        },
        getUser(state){
            return state.user
        },
        getAuthentication(state){
            return state.authentication
        }
    },
    mutations: {
        SET_USER(state, data){
            state.user = data
        },
        SET_AUTHENTICATION(state, data){
            state.authentication = data
        }
    },
    actions: {
        authUser({commit}){
            return axios.get('/api/user').then((res)=>{
                        commit('SET_USER', res.data)
                        commit('SET_AUTHENTICATION', true)
                        localStorage.setItem('auth', true)

                        if (routes.name != null){{
                            routes.push({name: 'dashboard'})
                        }}
                    }).catch(()=>{
                        commit('SET_USER', null)
                        commit('SET_AUTHENTICATION', false)
                        localStorage.removeItem('auth')

                        if (routes.name !== login){{
                            routes.push({name: 'login'})
                        }}
                    })

        }

    }
})
