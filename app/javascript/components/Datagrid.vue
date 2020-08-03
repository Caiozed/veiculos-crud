<template>
  <vs-row>
    <vs-col vs-align="center" vs-w="12">
    <vs-table :data="data">
        <template slot="header">
          <h3>
            {{header}}
          </h3>
        </template>
        <template slot="thead">
          <vs-th :key="i" v-for="(column,i) in columnDefs">
            {{column.name}}
          </vs-th>
        </template>

        <template slot-scope="{data}">
          <vs-tr :key="i" v-for="(entry, i) in data" >
            <vs-td :key="j" v-for="(column,j) in columnDefs">
              {{entry[column.field]}}
            </vs-td>
          </vs-tr>
        </template>
      </vs-table>
    </vs-col>
  </vs-row>
</template>

<script>
export default {
  name: "Datagrid",
  props:{
    columnDefs: {default: []},
    data: {default: []},
    header: {default: "adicione o header"}
  }
}
</script>
