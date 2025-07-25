"use client";

import { TodoDto } from "../../../openapi/todo/zod/types";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import {
  deleteTodoMutationOptions,
  updateTodoMutationOptions,
} from "@/openapi/todo/react-query/mutate-options";

interface TodoItemProps {
  todo: TodoDto;
}

export const TodoItem = ({ todo }: TodoItemProps) => {
  const queryClient = useQueryClient();
  const updateTodo = useMutation(updateTodoMutationOptions(queryClient));
  const deleteTodo = useMutation(deleteTodoMutationOptions(queryClient));

  const handleToggleDone = () => {
    updateTodo.mutate({
      id: todo.id,
      data: { done: !todo.done },
    });
  };

  const handleDelete = () => {
    deleteTodo.mutate(todo.id);
  };

  return (
    <li
      className={`group flex items-center justify-between gap-4 px-4 py-3 bg-white/80 dark:bg-gray-900/80 rounded-xl shadow border border-gray-100 dark:border-gray-800 mb-2 last:mb-0 transition-colors duration-150 ${
        todo.done
          ? "opacity-70 text-gray-500 dark:text-gray-400"
          : "hover:bg-gray-50 dark:hover:bg-gray-800"
      }`}
      aria-label={todo.description}
    >
      <div className="flex items-center gap-3 flex-1 min-w-0">
        <input
          type="checkbox"
          checked={todo.done}
          onChange={handleToggleDone}
          aria-label={todo.done ? "Mark as not done" : "Mark as done"}
          className="accent-green-500 h-5 w-5 rounded border-gray-300 focus:ring-2 focus:ring-green-400 transition-colors shadow-sm"
        />
        <span
          className={`truncate select-none text-base font-medium transition-colors duration-150 ${
            todo.done ? "line-through" : ""
          }`}
        >
          {todo.description}
        </span>
      </div>
      <button
        onClick={handleDelete}
        aria-label="Delete todo"
        className="opacity-80 group-hover:opacity-100 bg-red-500 hover:bg-red-600 text-white px-2.5 py-1 rounded-lg text-xs font-semibold shadow-sm transition-colors duration-150 focus:outline-none focus:ring-2 focus:ring-red-400 border border-red-500/30"
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          strokeWidth={1.5}
          stroke="currentColor"
          className="w-4 h-4 inline-block align-text-bottom"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            d="M6 18L18 6M6 6l12 12"
          />
        </svg>
      </button>
    </li>
  );
};
