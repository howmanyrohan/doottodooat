---
applyTo: "**"
---

# Readability is first priority

- Organize
- Abstract

## Note: You are allowed to refactor the code into a new file even if it is only used once

# Files and folder should be named in `kebab-case`

# Use hooks inside contexts (even if the hook is only used within the context)

# Adhere to eslint rules

# Use Tanstack React Query for data query and mutation

# Use Axios for API calls

# Use Zod and React Hook Form for every form

# Features folder structure

- `src/`
  - `app/`
    - `pageName/`
      - `page.tsx`
      - `layout.tsx`
  - `features/`
    - `pageName/`
      - `components/`
        - `example.tsx`
      - `hooks/`
        - `use-example.ts`
      - `context/`
        - `example-context.tsx`
      - `api.ts`
      - `types.ts`
      - `utils.ts`
