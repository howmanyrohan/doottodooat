"use client";

import { signInWithGoogle } from "../actions";

export default function SignInPage() {
  return (
    <div className="min-h-screen w-full bg-gradient-to-br from-gray-900 via-gray-950 to-gray-800 flex items-center justify-center p-4 sm:p-8 transition-colors duration-300">
      <main className="bg-gray-900/90 shadow-xl rounded-2xl px-6 py-10 w-full max-w-md flex flex-col gap-8 items-center border border-gray-800 transition-colors duration-300">
        <h1 className="text-3xl sm:text-4xl font-extrabold text-center w-full mb-2 bg-gradient-to-r from-blue-300 via-purple-300 to-pink-300 bg-clip-text text-transparent drop-shadow-sm">
          Sign In
        </h1>
        <button
          type="button"
          onClick={async () => {
            try {
              await signInWithGoogle();
            } catch (error) {
              console.error("Error signing in:", error);
            }
          }}
          className="w-full flex items-center justify-center gap-3 px-6 py-3 rounded-xl font-semibold text-lg bg-transparent text-blue-300 shadow-none transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-blue-400 dark:focus:ring-blue-300 border-2 border-transparent bg-clip-padding hover:bg-blue-950"
          style={{
            borderImage:
              "linear-gradient(to right, #60a5fa, #a78bfa, #f472b6) 1",
          }}
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24"
            fill="currentColor"
            className="w-6 h-6"
          >
            <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm5.35 8.35-4.59 4.59c-.39.39-1.02.39-1.41 0L8.76 12.35a.996.996 0 1 1 1.41-1.41L12 12.77l3.83-3.83a.996.996 0 0 1 1.41 0c.39.39.39 1.02 0 1.41z" />
          </svg>
          Sign in with Google
        </button>
      </main>
    </div>
  );
}
