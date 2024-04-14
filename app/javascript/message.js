function post (){
    const form = document.getElementById("form");
    form.addEventListener("submit", (event) => {
        event.preventDefault();
        const formData = new FormData(form);
        const user_id = document.getElementById("user_id").value; // ユーザーIDを取得
        const match_id = document.getElementById("match_id").value; // マッチIDを取得
        const XHR = new XMLHttpRequest();
        XHR.open("POST", `/users/${user_id}/matches/${match_id}/messages`, true);
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
        };
    });
   };
    window.addEventListener('turbo:load', post);