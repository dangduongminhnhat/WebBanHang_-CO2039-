var post = document.getElementById("post");
post.addEventListener("click", function () {
    var commentBoxValue = document.getElementById("comment-box").value;
    var user_name = "Người dùng ẩn danh:";
    var li = document.createElement("li");
    var text = document.createTextNode(user_name + commentBoxValue);
    li.appendChild(text);
    document.getElementById("unordered").appendChild(li);
});
