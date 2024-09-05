<template>
  <div>

    <div class="card">
      <div style="margin-bottom: 10px">
      <el-button type="primary" @click="handleAdd">新增</el-button>
      </div>
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
  form:{}
})

const handleAdd = () => {
  data.form = {}
  data.formVisible = true
}

const save = () => {
  request.post('/teacher/add', data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      data.formVisible = false
    } else {
      ElMessage.error(res.msg)
    }
  })
}

</script>