<dl>
    <dt>id</dt>
    <dd>${loginUser.id?long?c}</dd>
    <dt>用户名</dt>
    <dd>${loginUser.username}</dd>
    <dt>真实姓名</dt>
    <dd>${(loginUser.realName)!'没写'}</dd>
    <dt>年龄</dt>
    <dd>${(loginUser.age)!'没写'}</dd>
    <dt>身份证号</dt>
    <dd>${(loginUser.idNumber)!'没写'}</dd>
    <dt>地址</dt>
    <dd>${(loginUser.address)!'没写'}</dd>
    <dt>电话</dt>
    <dd>${(loginUser.phone)!'没写'}</dd>
    <dt>注册时间</dt>
    <dd>${loginUser.added?string('yyyy-MM-dd, HH:mm:ss')}</dd>
</dl>