import { Context, useContext } from "react";

export function useContextHook<T>(context: Context<T | undefined>): T {
  const contextValue = useContext(context);
  if (contextValue === undefined) {
    throw new Error(
      `${context.displayName ?? "Undefined Context"} must be used within its Provider`
    );
  }
  return contextValue;
}
