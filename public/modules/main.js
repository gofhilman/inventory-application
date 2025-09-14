import headerTyping from "/modules/header-typing.js";

const typing = document.querySelector("#typing");
const cursor = document.querySelector("#cursor");
const deleteButton = document.querySelector("#delete");
const deleteDialog = document.querySelector("#delete-dialog");

setInterval(() => {
  headerTyping.type();
  typing.textContent = headerTyping.typedString;
  cursor.textContent = headerTyping.cursor;
}, 120);

deleteButton.addEventListener("click", deleteDialog.showModal);

// TBC
