"use client";

import { TodoItem } from "./todo-item";
import { useQuery } from "@tanstack/react-query";
import { getTodoQueryOptions } from "@/openapi/todo/react-query/query-options";
import { Spinner } from "./spinner";

export const TodoList = () => {
  const todo = useQuery(getTodoQueryOptions);

  if (todo.isLoading)
    return (
      <div className="w-full flex flex-col items-center justify-center py-8 bg-white/80 dark:bg-gray-900/80 rounded-xl shadow border border-gray-100 dark:border-gray-800">
        <Spinner className="h-6 w-6 text-blue-500 mb-2" />
        <p className="text-gray-500 dark:text-gray-400 text-sm">
          Loading todos...
        </p>
      </div>
    );
  if (todo.isError)
    return (
      <div className="w-full flex flex-col items-center justify-center py-8 bg-white/80 dark:bg-gray-900/80 rounded-xl shadow border border-gray-100 dark:border-gray-800">
        <svg
          className="h-6 w-6 text-red-500 mb-2"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth="2"
            d="M6 18L18 6M6 6l12 12"
          />
        </svg>
        <p className="text-red-500 dark:text-red-400 text-sm">
          Failed to load todos
        </p>
      </div>
    );

  if (!todo.data || todo.data.length === 0) {
    return (
      <div className="w-full flex flex-col items-center justify-center py-8 bg-white/80 dark:bg-gray-900/80 rounded-xl shadow border border-gray-100 dark:border-gray-800">
        <svg
          className="h-6 w-6 text-gray-400 mb-2"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth="2"
            d="M9 17v-2a4 4 0 118 0v2M5 21h14a2 2 0 002-2v-5a2 2 0 00-2-2H5a2 2 0 00-2 2v5a2 2 0 002 2z"
          />
        </svg>
        <p className="text-gray-500 dark:text-gray-400 text-sm">
          No todos yet. Add one!
        </p>
      </div>
    );
  }

  return (
    <ul className="w-full bg-white/80 dark:bg-gray-900/80 rounded-xl shadow border border-gray-100 dark:border-gray-800 divide-y divide-gray-100 dark:divide-gray-800">
      {todo.data.map((todo) => {
        console.log(todo.id);
        return <TodoItem key={todo.id} todo={todo} />;
      })}
    </ul>
  );
};
