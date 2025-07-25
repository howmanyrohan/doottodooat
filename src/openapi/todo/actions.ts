"use server";

import { createClient } from "@/utils/supabase/server";
const supabase = await createClient();
import {
  TodoDto,
  CreateTodoDto,
  UpdateTodoDto,
} from "@/openapi/todo/zod/types";

const getTodo = async (): Promise<TodoDto[]> => {
  const { data, error } = await supabase.from("todo").select("*");
  if (error) throw error;
  return data as TodoDto[];
};

const createTodo = async (todo: CreateTodoDto): Promise<TodoDto> => {
  const { data, error } = await supabase
    .from("todo")
    .insert([todo])
    .select()
    .single();
  if (error) throw error;
  return data as TodoDto;
};

const updateTodo = async (
  id: number,
  todoData: UpdateTodoDto
): Promise<TodoDto> => {
  const { data, error } = await supabase
    .from("todo")
    .update(todoData)
    .eq("id", id)
    .select()
    .single();
  if (error) throw error;
  return data as TodoDto;
};

const deleteTodo = async (id: number): Promise<void> => {
  const { error } = await supabase.from("todo").delete().eq("id", id);
  if (error) throw error;
};

export { getTodo, createTodo, updateTodo, deleteTodo };
