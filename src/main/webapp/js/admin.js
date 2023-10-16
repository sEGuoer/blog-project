let AddUserList = false;

function inputAddUser() {
    if (AddUserList === false) {
        setAddUserForm();
        AddUserList = true;
        console.log(false)
    } else if (AddUserList === true) {
        document.getElementById("addUserForm").remove();
        AddUserList = false;
        console.log(true)
    }
}

function setAddUserForm() {
    let formElement = document.createElement("form");
    formElement.method = "post"
    formElement.action = "addUser"
    let divElement1 = document.createElement("div")
    let labelElement1 = document.createElement("label")
    labelElement1.for = "exampleInputEmail1"
    labelElement1.className = "form-label"
    labelElement1.innerText = "邮箱"
    let inputElement1 = document.createElement("input")
    inputElement1.type = "email"
    inputElement1.setAttribute("onblur", "pwdverify()")
    inputElement1.id = "exampleInputEmail1"
    inputElement1.setAttribute("aria-describedby", "emailHelp")
    inputElement1.name = "email"
    divElement1.append(labelElement1)
    divElement1.append(inputElement1)
    formElement.append(divElement1)

    let divElement2 = document.createElement("div")
    let labelElement2 = document.createElement("label")
    labelElement2.for = "exampleInputAccount1"
    labelElement2.className = "form-label"
    labelElement2.innerText = "账号"
    let inputElement2 = document.createElement("input")
    inputElement2.type = "text"
    inputElement2.id = "exampleInputAccount1"
    inputElement2.setAttribute("aria-describedby", "emailHelp")
    inputElement2.name = "account"
    divElement2.append(labelElement2)
    divElement2.append(inputElement2)
    formElement.append(divElement2)

    let divElement3 = document.createElement("div")
    let labelElement3 = document.createElement("label")
    labelElement3.for = "exampleInputPassword1"
    labelElement3.className = "form-label"
    labelElement3.innerText = "密码"
    let inputElement3 = document.createElement("input")
    inputElement3.type = "text"
    inputElement3.id = "exampleInputPassword1"
    inputElement3.setAttribute("aria-describedby", "emailHelp")
    inputElement3.name = "pwd"
    divElement3.append(labelElement3)
    divElement3.append(inputElement3)
    formElement.append(divElement3)

    let divElement4 = document.createElement("div")
    divElement4.className = "text-start"
    let buttonElement = document.createElement("button")
    buttonElement.type = "submit"
    buttonElement.className = "btn btn-danger"
    buttonElement.innerText = "添加"
    divElement4.append(buttonElement)
    formElement.append(divElement4)

    let formFatherhood = document.createElement("div")
    formFatherhood.className = "card-body text-center"
    formFatherhood.action = "RegisterVerify"
    formFatherhood.append(formElement)

    let cardTitle = document.createElement("div")
    cardTitle.className = "card-header"
    let h4 = document.createElement("h4")
    h4.className = "my-0 fw-normal"
    h4.innerText = "添加账号"
    cardTitle.append(h4)

    let sumDiv = document.createElement("div")
    sumDiv.className = "card m-auto rounded-3 shadow-sm"
    sumDiv.id = "addUserForm"
    sumDiv.append(cardTitle)
    sumDiv.append(formFatherhood)
    if (!document.getElementById("addUserForm")) {
        document.getElementById("UserList").after(sumDiv)
        console.log("add")
    }
    console.log("loading")
}




function nextPage() {
    console.log(3)
    let nowPage = parseInt(document.getElementById("nowPage").innerText) ;
    if (nowPage == parseInt(document.getElementById("pageSum").innerText)){
    }else{
        nowPage += 1
    }
    let currentURL = window.location.href
    let currentUrl = currentURL.split("?nowPage=");
    if (currentUrl.length == 1){
        let goatURL
        goatURL = currentURL + "?nowPage=" + nowPage
        window.location.href = goatURL
    }else {
        let goatURL
        goatURL = currentUrl[0] + "?nowPage=" + nowPage
        window.location.href = goatURL
    }
}

function homePage() {
    console.log(3)
    let nowPage = "1";
    let currentURL = window.location.href
    let currentUrl = currentURL.split("?nowPage=");
    if (currentUrl.length == 1) {
        let goatURL
        goatURL = currentURL + "?nowPage=" + nowPage
        window.location.href = goatURL
    } else {
        let goatURL
        goatURL = currentUrl[0] + "?nowPage=" + nowPage
        window.location.href = goatURL
    }
}
function lastPage() {
    let pageSum = document.getElementById("pageSum").innerText
    console.log(3)
    let currentURL = window.location.href
    let currentUrl = currentURL.split("?nowPage=");
    let lastPage = document.getElementById("lastPage").innerText;
    if (currentUrl.length == 1){
        let goatURL
        goatURL = currentURL + "?nowPage=" + lastPage
        window.location.href = goatURL
    }else {
        let goatURL
        goatURL = currentUrl[0] + "?nowPage=" + lastPage
        window.location.href = goatURL
    }
}

function previousPage() {
    console.log(3)
    let nowPage = parseInt(document.getElementById("nowPage").innerText) ;
    if (nowPage == 1){
    }else{
        nowPage -= 1
    }
    let currentURL = window.location.href
    let currentUrl = currentURL.split("?nowPage=");
    if (currentUrl.length == 1){
        let goatURL
        goatURL = currentURL + "?nowPage=" + nowPage
        window.location.href = goatURL
    }else {
        let goatURL
        goatURL = currentUrl[0] + "?nowPage=" + nowPage
        window.location.href = goatURL
    }

}


function pwdverify() {
    console.log(3)
    let element = document.createElement("div");
    element.innerText = "该邮箱已被注册";
    element.className = "text-danger"
    element.style = "display: none"
    element.setAttribute("id", "email-check")
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'RegisterVerify', true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
    let email = document.getElementById("exampleInputEmail1").value;
    let account = document.getElementById("exampleInputAccount1").value;
    let password = document.getElementById("exampleInputPassword1").value;
    xhr.send("email=" + email);
    let accounts = email.split("@");
    console.log(accounts[0]);
    if (!document.getElementById("email-check")) {
        document.getElementById("exampleInputEmail1").after(element);
    }
    xhr.onreadystatechange = function () {
        console.log(2);
        // readyState == 4说明请求已完成
        if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 304) && xhr.getResponseHeader("isEmail-exist") == "kajsldjasdjsalkdjalkdla") {
            // 从服务器获得数据
            console.log("add");
            document.getElementById("email-check").style = "";
        } else if (xhr.readyState == 4) {
            console.log("delete");
            document.getElementById("email-check").style = "display: none";
            document.getElementById("exampleInputAccount1").value = accounts[0];
        }
    };
    // datat应为'a=a1&b=b1'这种字符串格式，在jq里如果data为对象会自动将对象转成这种字符串格式
}

function updatepwdverify() {
    console.log(3)
    let element = document.createElement("div");
    element.innerText = "该邮箱已被注册";
    element.className = "text-danger"
    element.style = "display: none"
    element.setAttribute("id", "updateEmail-check")
    let email = document.getElementById("updateEmail1").value;
    var xhr = new XMLHttpRequest();
    xhr.open('Post', 'updateOnblur', true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
    xhr.send("email=" + email);
    let accounts = email.split("@");
    console.log(accounts[0]);
    if (!document.getElementById("updateEmail-check")) {
        document.getElementById("updateEmail1").after(element);
    }
    xhr.onreadystatechange = function () {
        console.log(2);
        // readyState == 4说明请求已完成
        if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 304) && xhr.getResponseHeader("isEmail-exist") == "kajsldjasdjsalkdjalkdla") {
            // 从服务器获得数据
            console.log("add");
            document.getElementById("updateEmail-check").style = "";
        } else if (xhr.readyState == 4) {
            console.log("delete");
            document.getElementById("updateEmail-check").style = "display: none";
            document.getElementById("updateAccount1").value = accounts[0];
        }
    };
    // datat应为'a=a1&b=b1'这种字符串格式，在jq里如果data为对象会自动将对象转成这种字符串格式
}


function deleteUser() {
    var x = confirm("Are you sure you want to delete?");
    if (x) {
        let deleteEmail = event.target.parentNode.parentNode.parentNode.id
        console.log(deleteEmail)
        event.target.parentNode.parentNode.parentNode.remove()
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'deleteUser', true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
        xhr.send("email=" + deleteEmail);
        xhr.onreadystatechange = function () {
            console.log(2);
            // readyState == 4说明请求已完成
            if (xhr.readyState == 4 && xhr.status == 200 || xhr.status == 304) {
                // 从服务器获得数据
                console.log("add");
            }
        };
    }
}

let needUpdateEmail
let addUpdateElement

let updateList = false

function updateUserButton() {
    updateInfo();
    let needUpdateEmailElement = event.target.parentNode.parentNode.parentNode
    needUpdateEmail = needUpdateEmailElement.id
    if (updateList === false) {
        updateList = true
        if (!document.getElementById("updateList1")) {
            document.getElementById(needUpdateEmail).after(addUpdateElement)
        }
    } else if (updateList === true) {
        document.getElementById("updateList1").remove()
        updateList = false
    }
}

function updateUser() {
    let updateUserEmail = document.getElementById("updateEmail1").value
    let updateUserPwd = document.getElementById("updatePassword1").value
    let updateUserAccount = document.getElementById("updateAccount1").value
    console.log(updateUserEmail, updateUserPwd, updateUserAccount)
    event.target.parentNode.parentNode.remove()
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'updateUser', true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
    xhr.send("email=" + updateUserEmail + "&account=" + updateUserAccount + "&pwd=" + updateUserPwd + "&updateEmail=" + needUpdateEmail);
    xhr.onreadystatechange = function () {
        console.log(2);
        // readyState == 4说明请求已完成
        if (xhr.readyState == 4 && xhr.status == 200 || xhr.status == 304) {
            // 从服务器获得数据
            console.log("add");
            location.reload();
        }
    };
}

function updateInfo() {
    let trElement = document.createElement("tr")
    trElement.id = "updateList1"
    let thElement = document.createElement("th")
    thElement.scope = "col"

    let tdElement1 = document.createElement("td")
    tdElement1.innerText = "邮箱"
    let inputElement1 = document.createElement("input")
    inputElement1.type = "email"
    inputElement1.setAttribute("onblur", "updatepwdverify()")
    inputElement1.id = "updateEmail1"
    inputElement1.setAttribute("aria-describedby", "emailHelp")
    inputElement1.name = "email"
    tdElement1.append(inputElement1)

    let tdElement2 = document.createElement("td")
    tdElement2.innerText = "密码"
    let inputElement2 = document.createElement("input")
    inputElement2.type = "text"
    inputElement2.id = "updatePassword1"
    inputElement2.setAttribute("aria-describedby", "emailHelp")
    inputElement2.name = "pwd"
    tdElement2.append(inputElement2)

    let tdElement3 = document.createElement("td")
    tdElement3.innerText = "账号"
    let inputElement3 = document.createElement("input")
    inputElement3.type = "text"
    inputElement3.id = "updateAccount1"
    inputElement3.setAttribute("aria-describedby", "emailHelp")
    inputElement3.name = "account"
    tdElement3.append(inputElement3)

    let tdElement4 = document.createElement("td")
    let buttonElement = document.createElement("button")
    buttonElement.type = "button"
    buttonElement.className = "btn btn-danger"
    buttonElement.innerText = "更新"
    buttonElement.setAttribute("onclick", "updateUser()")
    tdElement4.append(buttonElement)

    trElement.append(thElement)
    trElement.append(tdElement1)
    trElement.append(tdElement2)
    trElement.append(tdElement3)
    trElement.append(tdElement4)
    addUpdateElement = trElement;
}


