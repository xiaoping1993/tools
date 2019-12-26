其中三个参数请自行定义，各自含义如下：
//日志存储文件夹，同时日志文件按日期命名
-DlogPath="C:\\Users\\wangj01052\\Desktop\\CstoneDev\\" 
//监听目标文件夹路径
-DdirPath="C:\\Users\\wangj01052\\Desktop\\CstoneDev\\data\\" 
//获得的属性结果文件路径
-DfilesAttrsPath="C:\\Users\\wangj01052\\Desktop\\CstoneDev\\filesAttrsPath.txt" -jar getFileAttrs.jar

注意：
若要执行计划任务，可使用window计划任务定时执行run.bat（内容中参数据上自行修改）