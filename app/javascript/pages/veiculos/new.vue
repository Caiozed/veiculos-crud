<template>
  <div>
      <b-form @submit.prevent="onSubmit" @reset="onReset">
      <b-form-group
        id="input-group-1"
        label="Marca"
        label-for="input-1">
        <b-form-input
          id="input-1"
          v-model="veiculo.marca"
          type="text"
          required
          placeholder="Ferrari"
        ></b-form-input>
      </b-form-group>

      <b-form-group id="input-group-2" label="Veiculo" label-for="input-2">
        <b-form-input
          id="input-2"
          v-model="veiculo.veiculo"
          required
          placeholder="RTX7888"
        ></b-form-input>
      </b-form-group>

      <b-form-group id="input-group-3" label="Ano" label-for="input-3">
        <b-form-input
          id="input-2"
          type="number"
          v-model="veiculo.ano"
          required
          placeholder="1999"
        ></b-form-input>
      </b-form-group>

        <b-form-group id="input-group-3" label="Descricao" label-for="input-3">
        <b-form-input
          id="input-2"
          type="text"
          v-model="veiculo.descricao"
          required
          placeholder="..."
        ></b-form-input>
      </b-form-group>

      <b-form-group id="input-group-4" label="Vendido">
        <b-form-checkbox v-model="veiculo.vendido" id="checkboxes-4">
        </b-form-checkbox>
      </b-form-group>

      <b-button type="submit" variant="primary">Salvar</b-button>
      <b-button type="reset" variant="danger">Limpar</b-button>
    </b-form>
  </div>
</template>

<script>
import router from '../../routes'
import veiculoService from '../../services/veiculoService'

export default {
  mounted(){
    var id = this.$route.params.id;
    if(id){
      veiculoService.getOne(id)
        .then((response) =>{
          this.veiculo = response.data;
        }).catch((err) => console.log(err))
    }
  },
  methods:{
    onSubmit() {
      if(this.veiculo.id){
        veiculoService.update(this.veiculo)
          .then((response) =>{
                router.push("/")
          }).catch((err) => console.log(err))
      }else{
        veiculoService.create(this.veiculo)
          .then((response) =>{
                router.push("/")
          }).catch((err) => console.log(err))
      }
    },
    onReset() {
      this.veiculo = {id: this.veiculo.id }
    },
  },
  data(){
    return {
        veiculo: {}
      }
  }
}
</script>

<style scoped>

</style>
