"use client";

import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { CreateTodoDtoSchema } from "../../../openapi/todo/zod/schema";
import { CreateTodoDto } from "@/openapi/todo/zod/types";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import { createTodoMutationOptions } from "@/openapi/todo/react-query/mutate-options";
import { useEffect } from "react";
import { Spinner } from "./spinner";

export const TodoCreateForm = () => {
  const queryClient = useQueryClient();
  const {
    mutate: createTodo,
    isPending,
    isSuccess,
    isError,
    reset: resetTodo,
  } = useMutation(createTodoMutationOptions(queryClient));
  const {
    register,
    handleSubmit,
    formState: { errors },
    reset,
    watch,
  } = useForm<CreateTodoDto>({
    resolver: zodResolver(CreateTodoDtoSchema),
  });

  const descriptionValue = watch("description");
  useEffect(() => {
    if (isSuccess || isError) {
      resetTodo();
    }
  }, [descriptionValue, isSuccess, isError, resetTodo]);

  const onSubmit = (data: CreateTodoDto) => {
    console.log("Submitting todo:", data);
    createTodo(data, {
      onSuccess: () => {
        reset();
      },
    });
  };

  return (
    <form
      onSubmit={handleSubmit(onSubmit)}
      className="w-full bg-white/80 dark:bg-gray-900/80 shadow rounded-xl px-4 py-3 flex flex-col gap-2 border border-gray-100 dark:border-gray-800 transition-colors duration-300"
    >
      <div className="flex items-center gap-2">
        <input
          {...register("description")}
          type="text"
          placeholder="Add a new todo..."
          className="flex-grow border border-gray-300 dark:border-gray-700 rounded-l-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400 dark:focus:ring-blue-600 bg-white dark:bg-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-400 dark:placeholder-gray-500 transition-colors duration-200"
        />
        <button
          type="submit"
          className="bg-gradient-to-r from-blue-500 to-purple-500 hover:from-blue-600 hover:to-purple-600 text-white px-5 py-2 rounded-r-lg font-semibold shadow-sm transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-blue-400 dark:focus:ring-blue-600 flex items-center justify-center min-w-[64px]"
          disabled={isPending}
        >
          {isPending ? <Spinner className="h-5 w-5 text-white" /> : "Add"}
        </button>
      </div>
      {errors.description && (
        <p className="text-red-500 dark:text-red-400 text-sm mt-1 ml-1">
          {errors.description.message}
        </p>
      )}
      {isSuccess && (
        <p className="text-green-600 dark:text-green-400 text-sm mt-1 ml-1 animate-fade-in">
          Todo created successfully!
        </p>
      )}
      {isError && (
        <p className="text-red-500 dark:text-red-400 text-sm mt-1 ml-1 animate-fade-in">
          Failed to create todo. Please try again.
        </p>
      )}
    </form>
  );
};
