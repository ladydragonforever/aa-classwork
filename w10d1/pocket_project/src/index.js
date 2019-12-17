import warmUp, { htmlGenerator } from "./warmup.js";
import Clock from "./clock.js";
import { dogLinkCreator } from "./drop_down";
import {addToDo} from "./todo_list.js";

const clock = new Clock();

let el = document.getElementsByTagName("h3");
let li = document.getElementsByClassName("dog-link");
let ul = document.getElementsByClassName("drop-down-dog-list");

el[0].addEventListener("mouseenter", function(event1){
    for (let item of li) {
        item.style.display = "block";
       
    }    
});

ul[0].addEventListener("mouseenter", function (event1) {
    for (let item of li) {
        item.style.display = "block";

    }
});

el[0].addEventListener("mouseleave", function (event) {
    for (let item of li) {
        item.style.display = "";
    }

});

const form = document.getElementsByClassName("add-todo-form");
form[0].addEventListener("submit", addToDo);