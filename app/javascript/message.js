function post (){
    const form = document.getElementById("form");
    form.addEventListener("submit", (event) => {
        event.preventDefault();
        const formData = new FormData(form);
        const user_id = document.getElementById("user_id").value; // ユーザーIDを取得
        const match_id = document.getElementById("match_id").value; // マッチIDを取得
        const XHR = new XMLHttpRequest();
        console.log(user_id)
        console.log(match_id)
        XHR.open("POST", `/users/${user_id}/matches/${match_id}/messages`, true);
        console.log(XHR)
        XHR.responseType = "json";
        XHR.send(formData);
        XHR.onload = () => {
        const list = document.getElementById("list");
        const formText = document.getElementById("content");
        const item = XHR.response.post;
        const html = `
            <div class="right-message-container">
                <div class="message-date">${item.created_at}</div>
                <div class="right-message">
                    <div class="message-content">
                        ${item.content}
                    </div>
                </div>
            </div> `;
        list.insertAdjacentHTML("afterend", html);
        formText.value = "";
        console.log('sssss')
        };
    });
   };
    window.addEventListener('turbo:load', post);
    window.addEventListener('turbo:render', post);