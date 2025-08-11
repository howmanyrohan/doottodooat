import { TodoList } from "../features/todo/components/todo-list";
import { TodoCreateForm } from "../features/todo/components/todo-create-form";
import { redirect } from "next/navigation";
import { createClient } from "@/utils/supabase/server";

export default async function Home() {
  const supabase = await createClient();

  const {
    data: { user },
    error,
  } = await supabase.auth.getUser();

  if (error || !user) {
    redirect("/sign-in");
  }

  return (
    <div className="min-h-screen w-full bg-gradient-to-br from-blue-50 via-white to-purple-100 dark:from-gray-900 dark:via-gray-950 dark:to-gray-800 flex items-center justify-center p-4 sm:p-8 transition-colors duration-300">
      <main className="bg-white/90 dark:bg-gray-900/90 shadow-xl rounded-2xl px-6 py-10 w-full max-w-xl flex flex-col gap-8 items-center border border-gray-100 dark:border-gray-800 transition-colors duration-300">
        <h1 className="text-3xl sm:text-4xl font-extrabold text-center w-full mb-2 bg-gradient-to-r from-blue-600 via-purple-500 to-pink-400 dark:from-blue-300 dark:via-purple-300 dark:to-pink-300 bg-clip-text text-transparent drop-shadow-sm">
          Simple Todo App
        </h1>
        <TodoCreateForm />
        <div className="w-full border-t border-gray-200 dark:border-gray-700 my-2" />
        <TodoList />
      </main>
    </div>
  );
}
