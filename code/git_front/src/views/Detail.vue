<template>
  <div class="about">
    <el-row type="flex">
      <el-col :offset='3' :span="4">
          <div class="back-box" @click="backToHome">
            <el-icon :size="30" >
              <back></back>
            </el-icon> 
            <div class="back-word"> 
              返回
            </div>
          </div>
      </el-col>
      <el-col :span="10">
        <div>
          <h1 @click="showSome">{{table_name}}</h1>
        </div>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span='18' :offset="3">
        <el-table :data="tableData" style="width: 100%" :border="true">
          <el-table-column v-for="col in labelName" :prop='col' :key='col' :label="col" />
        </el-table>
      </el-col>
    </el-row>
    
  </div>
</template>

<script lang="ts">
import { useRouter } from 'vue-router'
import { ref } from '@vue/reactivity'
import { Back } from '@element-plus/icons'
import axios from 'axios'
export default {
  components: {
    Back
  },
  data() {
    return {
      labelName:[],
      tableData:[]
    }
  },
  setup() {
    const router = useRouter();

    let table_name = ref<any>(router.currentRoute.value.params.detail);

    // onMounted(getTables)
    let backToHome = () => {
      router.push({
        path: '/'
      })
    }
    return {
      table_name,
      backToHome,
    }
  },
  async created() {
    const router = useRouter();
    let table_name = ref<any>(router.currentRoute.value.params.detail);
    try {
          let res = await axios.post('/api/getTables', {
            table_name
          });
          // eslint-disable-next-line @typescript-eslint/ban-ts-comment
          // @ts-ignore
          this.tableData = res.data
          console.log(res)
          // eslint-disable-next-line @typescript-eslint/ban-ts-comment
          // @ts-ignore
          this.labelName = Object.keys(res.data[0])
          // console.log(this.labelName)
        } catch (error) {
          console.log(error)
        }
  },
  methods: {
  }
  
}
</script>

<style scoped>
  .back-box {
    display: flex;
    height: 100%;
    align-items: center;
    font-size: 15px;
    cursor:pointer;
  }

  .back-word {
    font-size: 20px;
    font-weight: 500;
  }
  .back-box:hover .back-word {
    font-size: 24px!important;
    font-weight: 600!important;
    transition: all 0.5s;
  }
  .header-box {
    display:flex;
    
  }
</style>
