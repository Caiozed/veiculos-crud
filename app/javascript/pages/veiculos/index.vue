<template>
  <div>
    <router-link to="new">
        <b-button variant="success">Novo <b-icon icon="plus" aria-hidden="true"></b-icon></b-button>
    </router-link>

    <b-table 
        selectable
        select-mode="single"
        @row-selected="onRowSelected" 
        hover 
        :items="items" 
        :fields="fields">
        <template v-slot:cell(vendido)="data">
            <b-form-checkbox v-model="data.value" disabled></b-form-checkbox>
        </template>
        <template v-slot:cell(editar)="data">
            <router-link :to="`new/${data.item.id}`">
                <b-icon icon="pencil-square" aria-hidden="true"></b-icon>
            </router-link>
        </template>
        <template v-slot:cell(deletar)="data">
            <a href="#" @click="deleteVeiculo(data.item.id)">
                <b-icon icon="trash" aria-hidden="true"></b-icon>
            </a>
        </template>
    </b-table>
  </div>
</template>
<script>
import veiculoService from '../../services/veiculoService'
import router from '../../routes'

export default {
    mounted(){
        veiculoService.get()
            .then((response) =>{
                this.items = response.data;
            }).catch((err) => console.log(err))
    },
    methods:{
        deleteVeiculo(id) {
            var self = this;
            veiculoService.delete(id)
                .then((response) => {
                    self.items = self.items.filter( f => f.id != id) 
                }).catch((err) => console.log(err))
        },
        onRowSelected(items) {
            router.push(`veiculos/${items[0].id}`)
        },
    },
    data() {
      return {
        fields: [
            {
                key: 'marca',
                sortable: true
            },
            {
                key: 'veiculo',
                sortable: false
            },
            {
                key: 'ano',
                label: 'Person age',
                sortable: true,
            },
            {
                key: 'descricao',
                sortable: true,
            },
             {
                key: 'vendido',
                sortable: true,
            },
             {
                key: 'created_at',
                label: "Criado Em",
                sortable: true,
            },
            {
                key: 'updated_at',
                label: "Atualizado Em",
                sortable: true,
            },
            {
                key: 'editar',
            },
            {
                key: 'deletar',
            }
        ],
        items: []
      }
    }
}
</script>

<style scoped>

</style>
