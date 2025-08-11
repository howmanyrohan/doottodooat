# Doottodooat - Next.js Todo Application

A modern, full-stack todo application built with Next.js, Supabase, and a standardized development workflow.

## 🚀 Quick Start

### Prerequisites

- Node.js 18+
- pnpm (preferred package manager)
- Supabase account

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd doottodooat
   ```

2. **Install dependencies**

   ```bash
   pnpm install
   ```

3. **Set up environment variables**

   ```bash
   cp .env.example .env.local
   # Fill in your Supabase credentials
   ```

4. **Run the development server**

   ```bash
   pnpm dev
   ```

5. **Open your browser**
   Navigate to [http://localhost:3000](http://localhost:3000)

## 📚 Documentation

This project follows strict coding standards and patterns. New developers should read through the documentation in order:

### Getting Started

- [Development Setup](./docs/development-setup.md) - Complete setup guide
- [Project Structure](./docs/project-structure.md) - Understanding the codebase organization
- [Coding Standards](./docs/coding-standards.md) - Rules and conventions we follow

### Development Patterns

- [Local State Management](./docs/local-state-management-pattern.md) - React Context patterns
- [Server State Management](./docs/server-state-management-pattern.md) - React Query patterns
- [Form Handling](./docs/form-handling-pattern.md) - React Hook Form + Zod validation
- [Component Guidelines](./docs/component-guidelines.md) - Building reusable components

### Tools & Configuration

- [Tech Stack](./docs/tech-stack.md) - Technologies and libraries used
- [Code Quality](./docs/code-quality.md) - ESLint, Prettier, Husky setup
- [API Documentation](./docs/api-documentation.md) - Backend API patterns
- [Testing Guide](./docs/testing-guide.md) - Testing strategies and setup

## 🛠️ Key Technologies

- **Framework**: Next.js 15 with App Router
- **Database**: Supabase (PostgreSQL)
- **Styling**: Tailwind CSS + shadcn/ui
- **State Management**: TanStack React Query + React Context
- **Forms**: React Hook Form + Zod validation
- **HTTP Client**: Axios
- **Code Quality**: ESLint + Prettier + Husky + lint-staged

## 🏗️ Project Structure

```
src/
├── app/                    # Next.js App Router pages
├── components/ui/          # Reusable UI components (shadcn/ui)
├── features/              # Feature-based modules
│   └── {feature}/
│       ├── components/    # Feature-specific components
│       ├── hooks/         # Custom hooks
│       ├── context/       # React Context providers
│       ├── api.ts         # API endpoints
│       ├── types.ts       # TypeScript types
│       └── utils.ts       # Utility functions
├── openapi/               # API layer with React Query
├── utils/                 # Global utilities
└── lib/                   # Configuration and setup
```

## 🤝 Contributing

1. Read the [Coding Standards](./docs/coding-standards.md)
2. Follow the [Development Workflow](./docs/development-workflow.md)
3. Ensure all tests pass and code is formatted
4. Submit a pull request with a clear description

## 📋 Available Scripts

```bash
pnpm dev          # Start development server
pnpm build        # Build for production
pnpm start        # Start production server
pnpm lint         # Run ESLint
pnpm type-check   # Run TypeScript checks
```

## 🔧 Development Workflow

This project uses automated code quality tools:

- **Pre-commit hooks** (via Husky) run linting and formatting
- **Conventional commits** are enforced via commitlint
- **TypeScript** strict mode for type safety
- **ESLint** for code quality
- **Prettier** for consistent formatting

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.
