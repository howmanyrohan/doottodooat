import * as api from "../api";
import { TodoDto } from "../zod/types";
import { UseQueryOptions } from "@tanstack/react-query";

const TODO_QUERY_KEY = "todo";

const getTodoQueryOptions: UseQueryOptions<TodoDto[], Error> = {
  queryKey: [TODO_QUERY_KEY],
  queryFn: api.getTodo,
};

export { TODO_QUERY_KEY, getTodoQueryOptions };
