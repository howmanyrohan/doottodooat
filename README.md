# doottodooat

A Flutter exampled starter project.

## Table of Contents

- [Setup](#setup)
- [Structure](#structure)

## Setup

1. Install [Flutter](https://docs.flutter.dev/get-started/install) and the [Supabase CLI](https://supabase.com/docs/guides/cli).
2. Create a [Supabase](https://supabase.com) project.
3. Copy `.env.example` to `.env` and fill in the URL and publishable key (Project Settings → API).
4. Apply the database:

```
supabase login
supabase link --project-ref <ref>
supabase db push --remote
```

5. Run:

```
flutter run --dart-define-from-file=.env
```

   On web:

```
flutter run -d web-server --web-port 8080 --dart-define-from-file=.env
```

6. Test:

```
flutter test
```

## Structure

```
lib/
  main.dart
  database/
  models/
  pages/
    <name>/
      page.dart
      notifier.dart
      interface.dart
      data.dart
      util.dart
      widgets/
        <name>/
          widget.dart
          state.dart
```
