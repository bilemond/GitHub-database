<template>
  <div>
    <el-row>
      <el-col :span="10" :offset="1">
        <div class="header-box">
          <img src='../assets/GitHub.svg' class="github-icon-class"/>
          <div class="header-title">GitHub数据库</div>
        </div>

      </el-col>

    </el-row>
    <el-row>
      <el-col :span="4" :offset="1">
        <el-menu
          class="el-menu-vertical-demo el-menu-border">
          <el-sub-menu index="1">
            <template #title>
              <span class="first-title">实体表</span>
            </template>
            <el-menu-item v-for="entity in entities" :key="entity.index" :index="entity.name" @click="toDetail">
              {{entity.name}}
            </el-menu-item>
          </el-sub-menu>
          <el-sub-menu index="2">
            <template #title>
              <span class="first-title">触发器</span>
            </template>
            <el-menu-item v-for="entity in relations" :key="entity.index" :index="entity.name"  @click="toDetail">
              {{entity.name}}
            </el-menu-item>
          </el-sub-menu>
          <el-sub-menu index="3">
            <template #title>
              <span class="first-title">视图</span>
            </template>
            <el-menu-item v-for="entity in relations" :key="entity.index" :index="entity.name"  @click="toDetail">
              {{entity.name}}
            </el-menu-item>
          </el-sub-menu>
        </el-menu>
      </el-col>
      <el-col :span='17' :offset="1">
        <div
          class="demo-shadow"
        >
          <img src="../assets/GitHub-ER.svg" class="er-class" />
        </div>
      </el-col>
    </el-row>
	</div>
</template>

<script lang="ts">
import { defineComponent, ref, reactive, onMounted } from 'vue';
import {useRouter} from 'vue-router';
import axios from 'axios'
import tables from './tables'
// import HelloWorld from '@/components/HelloWorld.vue'; // @ is an alias to /src

export default ({
  name: 'Home',
  components: {
    // HelloWorld,
  },
  setup() {
    // const github_icon_path = ref<string>("../assets/logo.png");
    const entities = reactive(tables)
    const relations = reactive([
      {
        name: 'install',
        index: '2-1'
      },
      {
        name: '受推荐',
        index: '2-2'
      }
    ])

    const router = useRouter()
    let toDetail = (el: any) => {
      console.log(el)
      router.push({
        path:`/${el.index}`
      })
    }

    // onMounted(() => {
    //   axios.post('api/user/getTables').then(res => {
    //     console.log(res)
    //   }).catch(err => {
    //     console.log
    //   })
    // })
    return {
      // github_icon_path,
      relations,
      entities,
      toDetail
    }
  }

});
</script>

<style scoped>
.first-title {
  font-size: 15px;
  font-weight: bold;
  color: #303133
}

.er-class {
  width: 100%;
}

.demo-shadow {
  /* height: 100px; */
  animation: floatBox 1s linear infinite;
  max-height: 100%;
  /* width: 50%; */
  border: 1px solid var(--el-border-color-base);
  
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04)
}

.github-icon-class {
  width: 40px;
}

.el-menu-border {
  /* border-top: 1px solid var(--el-border-color-base); */
  border: 1px solid var(--el-border-color-base);
  border-radius: 0.5em 0.5em 0.5em;
}

.el-menu-border >>> .el-sub-menu__title:hover, .el-menu-item:hover {
  background-color: #EBEEF5;
}

.header-box {
  display: flex;
  align-items: center;
  height: 80px;
  /* justify-content: space-between; */
}

.header-title {
  font-size: 26px;
  font-weight: bold;
  margin-left: 10px;
  color: #303133
}
</style>
