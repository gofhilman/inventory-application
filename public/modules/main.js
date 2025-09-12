import headerTyping from "/modules/header-typing.js";

const typing = document.querySelector("#typing");
const cursor = document.querySelector("#cursor");

setInterval(() => {
  headerTyping.type();
  typing.textContent = headerTyping.typedString;
  cursor.textContent = headerTyping.cursor;
}, 120);