<template>
    <div>
      <b-form>
      <b-form-group
        id="input-group-1"
        label="Marca"
        label-for="input-1">
        <b-form-input
        readonly
          id="input-1"
          v-model="veiculo.marca"
          type="text"
          required
          placeholder="Ferrari"
        ></b-form-input>
      </b-form-group>

      <b-form-group id="input-group-2" label="Veiculo" label-for="input-2">
        <b-form-input
        readonly
          id="input-2"
          v-model="veiculo.veiculo"
          required
          placeholder="RTX7888"
        ></b-form-input>
      </b-form-group>

      <b-form-group id="input-group-3" label="Ano" label-for="input-3">
        <b-form-input
        readonly
          id="input-2"
          type="number"
          v-model="veiculo.ano"
          required
          placeholder="1999"
        ></b-form-input>
      </b-form-group>

        <b-form-group id="input-group-3" label="Descricao" label-for="input-3">
        <b-form-input
        readonly
          id="input-2"
          type="text"
          v-model="veiculo.descricao"
          required
          placeholder="..."
        ></b-form-input>
      </b-form-group>

      <b-form-group id="input-group-4" label="Vendido">
        <b-form-checkbox disabled v-model="veiculo.vendido" id="checkboxes-4">
        </b-form-checkbox>
      </b-form-group>
    </b-form>
  </div>
</template>

<script>
import veiculoService from '../../services/veiculoService'
import router from '../../routes'

export default {
   mounted(){
    var id = this.$route.params.id;
    veiculoService.getOne(id)
      .then((response) =>{
        this.veiculo = response.data;
      }).catch((err) => console.log(err))
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
