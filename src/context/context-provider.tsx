import { ReactNode, Context } from "react";

type ContextProviderProps<T> = {
  children: ReactNode;
  context: Context<T | undefined>;
  useHook: () => T;
};

export function ContextProvider<T>({
  children,
  context,
  useHook,
}: ContextProviderProps<T>) {
  return <context.Provider value={useHook()}>{children}</context.Provider>;
}
