import Vue from 'vue'
import App from './App.vue'
import VueOnsen from 'vue-onsenui'
Vue.use(VueOnsen);
var VueTouch = require('vue-touch')
Vue.use(VueTouch, {name: 'v-touch'})

new Vue({
  el: '#app',
  render: h => h(App),
  data() {
   return {
     carouselIndex: 0,
     items: {
       BLUE: '#085078',
       DARK: '#373B44',
       ORANGE: '#D38312'
     },
     dots: {
       textAlign: 'center',
       fontSize: '30px',
       color: '#fff',
       position: 'absolute',
       bottom: '40px',
       left: 0,
       right: 0
     }
   };
 }
})
