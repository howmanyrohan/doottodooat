import { z } from "zod";

const TodoDtoSchema = z.object({
  id: z.number(),
  description: z.string(),
  done: z.boolean().default(false),
});

const CreateTodoDtoSchema = TodoDtoSchema.omit({ id: true, done: true }).extend(
  {
    description: z.string().min(1, "Description is required"),
  }
);

const UpdateTodoDtoSchema = TodoDtoSchema.pick({
  description: true,
  done: true,
}).partial();

export { TodoDtoSchema, CreateTodoDtoSchema, UpdateTodoDtoSchema };
