import { TodoDto, CreateTodoDto, UpdateTodoDto } from "../zod/types";
import * as api from "../api";

import { QueryClient, UseMutationOptions } from "@tanstack/react-query";

import { TODO_QUERY_KEY } from "./query-options";

const createTodoMutationOptions = (
  queryClient: QueryClient
): UseMutationOptions<TodoDto, Error, CreateTodoDto> => ({
  mutationFn: api.createTodo,
  onSettled: () =>
    queryClient.invalidateQueries({ queryKey: [TODO_QUERY_KEY] }),
});

const updateTodoMutationOptions = (
  queryClient: QueryClient
): UseMutationOptions<TodoDto, Error, { id: number; data: UpdateTodoDto }> => ({
  mutationFn: (params) => api.updateTodo(params.id, params.data),
  onSettled: () =>
    queryClient.invalidateQueries({ queryKey: [TODO_QUERY_KEY] }),
});

const deleteTodoMutationOptions = (
  queryClient: QueryClient
): UseMutationOptions<void, Error, number> => ({
  mutationFn: api.deleteTodo,
  onSettled: () =>
    queryClient.invalidateQueries({ queryKey: [TODO_QUERY_KEY] }),
});

export {
  createTodoMutationOptions,
  updateTodoMutationOptions,
  deleteTodoMutationOptions,
};
