# Public API

Every slice exposes a public API through its root `index.ts`. Other slices must import only from this public API.

## Rules

- Each slice has one `index.ts` at its root.
- All consumers import from the slice directory, never from internal files.
- Re-export only what is intended for external use.
- Do not re-export internals that may change frequently.

## Example

```ts
// features/add-to-cart/index.ts
export { AddToCartButton } from './ui/AddToCartButton';
export { useCartCount } from './lib/useCartCount';
export type { AddToCartPayload } from './api/addToCart';
```

```ts
// widgets/header/index.ts
export { Header } from './ui/Header';
```

## Import pattern

```ts
// ✅ Good
import { AddToCartButton } from 'features/add-to-cart';

// ❌ Bad
import { AddToCartButton } from 'features/add-to-cart/ui/AddToCartButton';
```

Use path aliases (e.g., `features/...`, `shared/...`) so the public API rule is easy to follow.

## Shared public API

`shared` is also a slice in the lowest layer. It exposes primitives through its own `index.ts` or through sub-module indexes such as `shared/ui`, `shared/lib`, `shared/api`.

```ts
import { Button } from 'shared/ui';
import { formatDate } from 'shared/lib';
```
