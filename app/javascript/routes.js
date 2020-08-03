import RootVeiculos from './pages/veiculos/root'
import IndexVeiculo from './pages/veiculos/index'
import ShowVeiculo from './pages/veiculos/show'
import NewVeiculo from './pages/veiculos/new'
import VueRouter from 'vue-router'

const routes = [
    { path: '/', component: RootVeiculos, 
        children:[
            { path: '/', component: IndexVeiculo },
            { path: '/veiculos/:id', component: ShowVeiculo },
            { path: '/new/:id?', component: NewVeiculo },
        ]
     },
  ]
  
  const router = new VueRouter({
    routes
  })
  
  export default router;