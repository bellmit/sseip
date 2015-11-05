<!doctype html>
<html>
<head>
    <title></title>
</head>
<body>
<div>出错了！</div>
<#--<div>${ex???string('Y','N')}</div>-->
<div>${ex???then((ex.message)!'','')}</div>
<div>
    <a href="javascript:;" id="back-control">退回去</a>
</div>
<script>
    document.getElementById("back-control").onclick = function (e) {
        history.back(1);
    };
</script>
<#--<div>${exception.message}}</div>-->
<#--<div>${exception}</div>-->
<#--<div>${exception.class}</div>-->
<#--<div>${exception.cause!''}</div>-->
</div>
</body>
</html>