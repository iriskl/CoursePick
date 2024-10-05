<template>
  <div>

    <div class="card" style="margin-bottom: 5px">
      <el-input v-model="data.name" style="width: 300px; margin-right: 10px" placeholder="请输入教师姓名查询"></el-input>
      <el-button type="primary" @click="load">查询</el-button>
      <el-button type="info" @click="reset">重置</el-button>
    </div>

    <div class="card">
      <div style="margin-bottom: 10px">
      <el-button type="primary" @click="handleAdd">新增</el-button>
      </div>
      <el-table :data="data.tableData" stripe>
        <el-table-column label="用户名" prop="username"></el-table-column>
        <el-table-column label="头像" prop="avatar"></el-table-column>
        <el-table-column label="名称" prop="name"></el-table-column>
        <el-table-column label="性别" prop="sex"></el-table-column>
        <el-table-column label="职称" prop="title"></el-table-column>
        <el-table-column label="角色" prop="role"></el-table-column>
        <el-table-column label="操作" align="center" width="160">
          <template #default="scope">
            <el-button type="primary" @click="handleEdit(scope.row)">编辑</el-button>
            <el-button type="danger" @click="handleDelete(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <div class="card">
      <el-pagination background layout="prev, pager, next" v-model:page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" @current-change="changePage"/>
    </div>

    <div>
      <el-dialog title="教师信息" width="40%" v-model="data.formVisible" :close-on-click-modal="false" destroy-on-close>
        <el-form :model="data.form" label-width="100px" style="padding-right: 50px">
          <el-form-item label="账号" prop="username">
            <el-input v-model="data.form.username" autocomplete="off" placeholder="请输入账号"/>
          </el-form-item>
          <el-form-item label="姓名" prop="name">
            <el-input v-model="data.form.name" autocomplete="off" placeholder="请输入姓名"/>
          </el-form-item>
          <el-form-item label="性别" prop="sex">
            <el-select v-model="data.form.sex" placeholder="请选择性别" style="width: 100%">
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="职称" prop="title">
            <el-select v-model="data.form.title" placeholder="请选择职称" style="width: 100%">
              <el-option label="讲师" value="讲师"></el-option>
              <el-option label="副教授" value="副教授"></el-option>
              <el-option label="教授" value="教授"></el-option>
            </el-select>
          </el-form-item>
        </el-form>
        <template #footer>
      <span class="dialog-footer">
        <el-button @click="data.formVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">保 存</el-button>
      </span>
        </template>
      </el-dialog>
    </div>

  </div>
</template>

<script setup>
import {reactive} from "vue";
import request from "@/utils/request";
import {ElMessageBox, ElMessage} from "element-plus";

const data = reactive({
  formVisible: false,
  form:{},
  tableData: [],
  pageNum: 1,
  pageSize: 5,
  total: 0,
  name: null
})

const load = () => {
  request.get('/teacher/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      name: data.name
    }
  }).then(res => {
    if (res.code === '200') {
      data.tableData = res.data?.list
      data.total = res.data?.total
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const changePage = (pageNum) => {
  data.pageNum = pageNum
  load()
}

const handleAdd = () => {
  data.form = {}
  data.formVisible = true
}

const save = () => {
  request.post('/teacher/add', data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      load()
      data.formVisible = false
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const reset = () => {
  data.name = null
  load()
}

load()
</script>
