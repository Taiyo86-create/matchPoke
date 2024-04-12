function post (){
    const form = document.getElementById("form");
    form.addEventListener("submit", () => {
        const formData = new FormData(form);
        const user_id = document.getElementById("user_id").value; // ユーザーIDを取得
        const match_id = document.getElementById("match_id").value; // マッチIDを取得
        const XHR = new XMLHttpRequest();
        XHR.open("POST", `/users/${user_id}/matches/${match_id}/messages`, true);
        XHR.responseType = "json";
        XHR.send(formData);
    });
   };
    window.addEventListener('turbo:load', post);