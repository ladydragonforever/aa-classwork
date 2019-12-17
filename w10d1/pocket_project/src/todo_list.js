let todos = [];

const ul = document.getElementsByClassName("todos");
const form = document.getElementsByClassName("add-todo-form");
const todo = document.getElementsByName("add-todo"); 
let value = todo[0].placeholder;

const item = {
    toDoValue: value,
    done: false
};

function addTodo(){
    
    todos.push(item); 
}








