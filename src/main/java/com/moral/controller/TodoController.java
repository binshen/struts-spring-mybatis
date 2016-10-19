package com.moral.controller;

import com.moral.model.Todo;
import com.moral.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class TodoController extends BaseAction {

    @Autowired
    TodoService todoService;

    public String execute(){
        return SUCCESS;
    }

    public String index(HttpServletRequest request, Map model) {
        //List<Todo> todoList = todoService.selectTodoList();
        //model.put("todoList", todoList);
        //model.put("site_name", "TODO List");
        return "index";
    }

    public String add(HttpServletRequest request, Map model) {
        Todo todo = new Todo();
        todo.setTitle(request.getParameter("title"));
        todo.setPost_date(new Date());
        todo.setFinished(0);
        todoService.insertTodo(todo);
        return "redirect:/todo/index";
    }

    public String edit(@PathVariable("id") int id, Map model) {
        model.put("site_name", "TODO List");
        model.put("todo", todoService.selectTodo(id));
        return "edit";
    }

    public String save(@PathVariable("id") int id, HttpServletRequest request, Map model) {
        Todo todo = new Todo();
        todo.setId(id);
        todo.setTitle(request.getParameter("title"));
        todoService.updateTitle(todo);
        return "redirect:/todo/index";
    }

    public String delete(@PathVariable("id") int id, Map model) {
        todoService.deleteTodo(id);
        return "redirect:/todo/index";
    }

    public String finish(@PathVariable("id") int id, @PathVariable("status") int status, Map model) {
        Todo todo = new Todo();
        todo.setId(id);
        todo.setFinished(status);
        todoService.updateStatus(todo);
        return "redirect:/todo/index";
    }
}
