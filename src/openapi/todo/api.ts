import axios from "axios";
import { TodoDto, CreateTodoDto, UpdateTodoDto } from "./zod/types";

const API_URL = "/api/todo";

const getTodo = async (): Promise<TodoDto[]> => {
  const response = await axios.get<TodoDto[]>(API_URL);
  return response.data;
};

const createTodo = async (todo: CreateTodoDto): Promise<TodoDto> => {
  const response = await axios.post<TodoDto>(API_URL, todo);
  return response.data;
};

const updateTodo = async (
  id: number,
  todoData: UpdateTodoDto
): Promise<TodoDto> => {
  const response = await axios.put<TodoDto>(`${API_URL}/${id}`, todoData);
  return response.data;
};

const deleteTodo = async (id: number): Promise<void> => {
  await axios.delete(`${API_URL}/${id}`);
};

export { getTodo, createTodo, updateTodo, deleteTodo };
