"use server";

import { createClient } from "@/utils/supabase/server";
import { redirect } from "next/navigation";
import { Provider } from "@supabase/supabase-js";

const signInWith = (provider: Provider) => async () => {
  const supabase = await createClient();
  const url = process.env.NEXT_PUBLIC_SITE_URL;
  const { data, error } = await supabase.auth.signInWithOAuth({
    provider,
    options: {
      redirectTo: `${url}`,
    },
  });

  if (error) {
    console.error(error);
    return redirect("/sign-in");
  }

  if (data) {
    return redirect(data.url);
  }
};

export const signInWithGoogle = signInWith("google");
