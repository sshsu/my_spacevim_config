## 安装 && 使用
将此文件拷贝到的~/.SpaceVim.d下覆盖文件即可

## 常用功能

### 文件搜索
```
ctrl + p
```

### 内容搜索
```
ctrl + f
```

### 高亮
```
\ + m
```

### 声明（定义）跳转
```
ctrl + g
```
需要安装配置ycm,ycm的使用需要生成编译器选项文件,vim打开当前目录，运行后会自动加载
```
:YcmGenerateConfig
```




### 定义跳转
ycm经常会跳转到声明， 结合cscope可以更好的定义处,需要安装ycm(不安装则只使用cscope进行搜索) 和 cscope
```
ctrl + d
```
需要在工程目录下cscope的符号文件，启动vim的时候会自动加载
```
find project_dir -name "*.c" -o -name "*.h" > cscope.files
cscope -Rbq -i cscope.files
```

### cscope 符号更新
```
<f4>
```
需要在工程目录下生成cscope.files，如下指令
```
find dir_complete_path -name "*.c" -o -name "*.h" -o -name "*.cpp" > cscope.files
```

