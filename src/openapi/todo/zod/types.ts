import { z } from "zod";
import {
  TodoDtoSchema,
  CreateTodoDtoSchema,
  UpdateTodoDtoSchema,
} from "./schema";

type TodoDto = z.infer<typeof TodoDtoSchema>;
type CreateTodoDto = z.infer<typeof CreateTodoDtoSchema>;
type UpdateTodoDto = z.infer<typeof UpdateTodoDtoSchema>;

export type { TodoDto, CreateTodoDto, UpdateTodoDto };
