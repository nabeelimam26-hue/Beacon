# Beacon — Design System Specification
**Phase 0 · Foundational Design Language**
Status: implementation-ready, pre-code

---

## 1. Brand Identity & Visual Philosophy

**What Beacon is not:** an Instagram clone, a WhatsApp clone, a Discord clone, or a generic SaaS dashboard. It is not playful, not gradient-heavy, not trying to look "AI-generated modern."

**What Beacon is:** a calm, high-signal communication tool. The name is literal — a beacon is a single, deliberate point of light that cuts through noise so you can find your way. Every visual decision should reinforce that: **one accent color used with intent, a quiet neutral base, and no decoration that doesn't carry meaning.**

Personality in three words: **steady, precise, warm-minimal.** Think of the tone of a well-made physical tool (a good notebook, a well-designed lamp) rather than a startup dashboard. Confidence comes from restraint, not from visual flourish.

Design priority order (explicit, in this order): **clarity → speed → hierarchy → elegance → personality.** When two goals conflict, the earlier one wins. Personality is the last 5%, never the first decision.

---

## 2. Primary, Secondary & Accent Colors

- **Primary (Beacon Ink):** a warm near-black, not pure `#000000` — used for text and dark-mode surfaces. Warmth keeps it from reading as sterile/clinical SaaS gray.
- **Accent (Beacon Amber):** `#E8A23D` — the single beacon-light color. Used *only* for: primary actions (send button, primary CTA), active/selected navigation state, unread indicators, focus rings, and the reply-quote accent bar. Nowhere else. Its rarity is what makes it work.
- **Secondary (Beacon Slate):** a muted blue-gray, used for secondary buttons, links-that-aren't-primary-actions, and informational accents. Never competes with amber for attention.

No purple/violet "AI gradient" palette anywhere in the app. No gradients as decoration at all (one narrow exception: a subtle 2-stop gradient is permitted only on the app's loading/splash mark, nowhere in the working UI).

---

## 3. Complete Light & Dark Palettes

| Token | Light | Dark | Use |
|---|---|---|---|
| `bg.base` | `#FAF9F6` | `#121110` | App background |
| `bg.surface` | `#FFFFFF` | `#1B1A18` | Cards, panels, sidebar |
| `bg.surface-raised` | `#FFFFFF` + shadow-sm | `#211F1D` | Modals, popovers |
| `bg.sunken` | `#F1EFE9` | `#0C0B0A` | Input fields, code/file chips |
| `accent.default` | `#E8A23D` | `#F0B15A` | Primary actions |
| `accent.hover` | `#D6912E` | `#F5BE71` | Hover state |
| `accent.subtle` | `#FCEFD9` | `#3A2E17` | Own-message bubble tint, unread bg |
| `secondary.default` | `#5E7183` | `#8FA0AF` | Secondary actions, links |
| `text.primary` | `#1C1A17` | `#F2F0EC` | Body text, names |
| `text.secondary` | `#5C5852` | `#B8B4AC` | Timestamps, metadata |
| `text.muted` | `#8C8880` | `#7A766E` | Placeholders, disabled text |
| `border.hairline` | `#1C1A17` @ 8% | `#F2F0EC` @ 10% | Dividers |
| `border.strong` | `#1C1A17` @ 18% | `#F2F0EC` @ 22% | Input borders, focus outlines |

Dark mode is not "light mode inverted" — it uses genuinely different neutral warmth and slightly higher accent luminance (`#F0B15A` vs `#E8A23D`) so amber doesn't look muddy against dark backgrounds.

---

## 4. Backgrounds & Surfaces

Three-level surface model only (not five or six — extra levels create visual noise without adding meaning):
1. **Base** — the app's canvas.
2. **Surface** — sidebars, message list background, cards.
3. **Sunken** — input fields, file-chip backgrounds, code blocks — things that feel "recessed" for input or reference.

Surfaces are separated by **subtle fill differences first, hairline borders second, shadow last.** Reach for shadow only for genuinely floating elements (modals, context menus, toasts).

---

## 5. Text Colors

- **Primary text** (`text.primary`) — message content, sender names, headings. Target contrast ≥ 7:1 against `bg.surface`.
- **Secondary text** (`text.secondary`) — timestamps, "typing...", file metadata, read receipts. ≥ 4.5:1.
- **Tertiary/muted** (`text.muted`) — placeholders, disabled states, empty-state captions. Not used for anything the user needs to read reliably.

---

## 6. Semantic Colors (Success / Warning / Error / Info)

Kept deliberately desaturated relative to typical SaaS palettes — they should feel like part of Beacon's world, not bolted-on Bootstrap colors.

| Semantic | Light | Dark | Use |
|---|---|---|---|
| Success | `#4C7A4E` | `#7FB07E` | Delivered/read confirmation (rare, subtle use — see §26) |
| Warning | `#B8842E` | `#D6A24E` | Weak connection, large file warning |
| Error | `#B4453A` | `#D97066` | Failed send, upload failure |
| Info | `#5E7183` (= secondary) | `#8FA0AF` | System messages, neutral notices |

Error is a muted brick-red, not alarm-red — errors in a chat app are common (network hiccups) and shouldn't feel like a crisis every time.

---

## 7–8. Typography, Hierarchy, Weights & Line Heights

Font pairing chosen specifically to avoid the "default Flutter/AI app" look (Roboto/system-default everywhere):

- **UI & body text — Inter.** Exceptional legibility at small sizes, the right choice for dense chat text and long reading sessions.
- **Headings, wordmark, empty states — General Sans.** A grotesque with more character than Inter, used sparingly for section headers and the Beacon wordmark — gives the brand a distinct voice without sacrificing the body's readability.
- **Metadata — IBM Plex Mono.** Timestamps, file sizes, file extensions, message IDs in dev/debug views. A monospace accent for utilitarian data reinforces the "serious tool" personality and is a deliberate point of difference from every chat app that sets timestamps in the body font.

| Style | Font | Size | Weight | Line height |
|---|---|---|---|---|
| Display (empty states, onboarding) | General Sans | 28px | 600 | 1.25 |
| H1 (screen titles) | General Sans | 20px | 600 | 1.3 |
| H2 (section headers) | General Sans | 16px | 600 | 1.35 |
| Body / message text | Inter | 15px | 400 | 1.5 |
| Sender name | Inter | 14px | 500 | 1.4 |
| Secondary / metadata (non-numeric) | Inter | 13px | 400 | 1.4 |
| Timestamps, file size, counts | IBM Plex Mono | 12px | 400 | 1.4 |
| Button label | Inter | 14px | 500 | 1.0 |

**Weight discipline:** only 400 / 500 / 600 are used anywhere in the app. 700 (bold) is never used — 600 is the ceiling, which keeps the whole interface feeling calm rather than shouty.

Chat body text sits at **15px/1.5** — slightly larger and looser than typical chat apps (13–14px), because sustained readability across long study-group threads matters more than cramming more messages on screen.

---

## 9. Spacing Scale

4px base unit, used with strict discipline — no arbitrary one-off values anywhere in the app:

`4 · 8 · 12 · 16 · 20 · 24 · 32 · 40 · 48 · 64`

- `4` — icon-to-label gaps, tight inline spacing
- `8` — internal chip/badge padding
- `12` — internal card padding (compact), space between grouped messages
- `16` — standard component padding, space between ungrouped messages
- `20–24` — section padding, sidebar internal margin
- `32–48` — major layout gutters
- `64` — empty-state vertical rhythm

---

## 10. Border-Radius System

Restrained on purpose — no "everything is a pill" aesthetic:

| Token | Value | Use |
|---|---|---|
| `radius.sm` | 6px | Chips, badges, small buttons, input fields |
| `radius.md` | 10px | Cards, file-attachment cards, standard buttons |
| `radius.lg` | 16px | Modals, bottom sheets, image/video media frames |
| `radius.bubble` | 14px, with the corner nearest the avatar reduced to 4px | Message bubbles (see §18) |

Nothing in the app exceeds 16px radius. No fully pill-shaped buttons except small status chips (typing indicator, presence badge).

---

## 11. Borders & Dividers

Hairline only: **1px, 8–10% opacity of `text.primary`.** Borders are a last resort for separation — prefer a fill-color step between surfaces first. Where a divider is unavoidable (e.g. between the conversation list and chat pane on desktop), it's a single hairline, never a shadow-simulated edge.

---

## 12. Shadows / Elevation

Flat by default. Shadow exists for exactly three cases, all genuinely "floating" content:

| Level | Shadow | Use |
|---|---|---|
| `elevation.0` | none | Cards, bubbles, sidebar, inputs — everything in normal flow |
| `elevation.1` | `0 2px 8px rgba(0,0,0,0.08)` | Dropdown menus, reaction picker, tooltips |
| `elevation.2` | `0 8px 24px rgba(0,0,0,0.14)` | Modals, dialogs |

No neumorphism, no glassmorphism/blur panels, no glow effects. `BackdropFilter` blur is avoided app-wide for performance reasons too (see §32).

---

## 13. Iconography

Single outline icon set throughout (Tabler-style, 1.5px stroke, consistent corner rounding) — 20px inline, 24px in toolbars/nav. Icons are **outline by default; filled variant reserved exclusively for the active/selected state** (active nav item, selected reaction). This gives selection state a real visual signal without needing color alone.

No mixed icon styles, no emoji used as UI icons (emoji are reserved for reactions/content, not chrome).

---

## 14. Buttons & States

Three tiers, used consistently everywhere:

- **Primary** — filled `accent.default`, `text.primary`-on-amber (dark ink text, not white, for contrast+warmth). Used once per screen/context max — there is one primary action, not three.
- **Secondary** — 1.5px `border.strong` outline, transparent fill, `text.primary` label.
- **Tertiary/ghost** — no border, no fill, `secondary.default` label — used for low-emphasis actions (cancel, "see all").
- **Destructive** — outline or text-only in `error`, filled only inside confirmation dialogs.

States: `default → hover (bg darkens 8%) → pressed (scale 0.97, bg darkens 14%) → disabled (40% opacity, no interaction) → loading (label replaced by a small inline spinner, button width unchanged — never a full skeleton button)`.

---

## 15. Text Inputs & Search

Flat `bg.sunken` fill, `radius.sm`, 1.5px `border.strong` only on focus (no border at rest — reduces visual noise across a form-free, chat-heavy app). Focus state is a clean color change to `accent.default`, **not a glow/shadow** — glow effects are explicitly avoided as a "generic AI app" tell.

Search fields are pinned at the top of the conversation list and the file-library view, always visible, never a modal overlay — speed over ceremony.

---

## 16. Cards

`bg.surface`, `radius.md`, 16–20px internal padding, hairline border optional (used when the card sits directly on `bg.surface` with no natural separation, omitted when it sits on `bg.base`). Cards never stack shadow AND border — pick one separation method per context.

---

## 17. Navigation

**Desktop:** persistent three-pane layout — conversation list (fixed 280–320px) · active chat (fluid) · optional context panel (files/members, collapsible, 280px). Custom-styled title bar to keep window chrome consistent with the rest of the app rather than default OS chrome breaking the visual language.

**Mobile:** no bottom tab bar. Chat-first means the conversation list *is* the home screen — a persistent bottom nav would compete with it for attention. Navigation is a simple stack: conversation list → chat screen → (files/members as a push-in panel). A single top app bar carries search + compose.

---

## 18. Message Bubbles

- **Own messages:** right-aligned, `accent.subtle` fill (a very light amber tint — never a fully saturated amber fill, which would hurt readability and look like a notification badge, not text).
- **Others' messages:** left-aligned, `bg.surface` fill with hairline border.
- **Shape:** `radius.bubble` (14px) on three corners, **4px on the corner adjacent to the avatar** — this asymmetry reads as directional "tail" without an actual pointed tail shape, which keeps the geometry clean and modern rather than cartoonish.
- **Grouping:** consecutive messages from the same sender within ~2 minutes collapse spacing to `spacing.4`, show avatar/name once, and use full `radius.bubble` only on the first and last bubble in the run (middle bubbles use a reduced 6px radius on the grouped edge) — this is what makes dense group-chat threads feel calm instead of stacked-box noise.

---

## 19. Reply-to-Message UI

A quoted reference bar sits above the message, inside the same bubble: 2px `accent.default` left border, sender name in `text.secondary`/500 weight, one line of truncated original content below it in `text.muted`. Tapping the quote scrolls to and briefly highlights (background pulse, 600ms, once) the original message. No separate modal or card — it's part of the bubble's own layout.

---

## 20. File Attachment Cards (PDF / DOCX / PPTX / ZIP / etc.)

This is a core differentiator, so it gets a dedicated, consistent component:

- `radius.md` card, `bg.sunken` fill, fixed height (56–64px), horizontal layout.
- Left: a colored file-type badge (not a generic paperclip) — filled rounded-square icon, color-coded by type: PDF = coral, DOCX = slate blue, PPTX = amber, ZIP = neutral gray, generic/unknown = muted gray. Extension text in the badge, `IBM Plex Mono`, 10px.
- Middle: filename (middle-truncated, never end-truncated, so extensions and distinguishing suffixes stay visible) in `text.primary`/Inter 14px/500, file size + type below in `text.secondary`/Plex Mono 12px.
- Right: action control — download icon at rest; **during transfer, a circular progress ring replaces the icon** (determinate, not an indeterminate spinner, since Supabase resumable uploads give real progress); on completion, a checkmark that fades to the file icon after 1.5s.
- Tapping anywhere on the card (not just the icon) opens/downloads — large hit target, important on mobile.

---

## 21. Image / Video / Audio Message Presentation

- **Images:** inline within the bubble, max-width constrained to ~60% of chat column, aspect ratio preserved, `radius.md` corners matching the bubble's rounding logic. Tap opens full-screen viewer via hero/shared-element transition (see §28).
- **Videos:** same frame treatment as images, with a centered outline play icon and a duration badge (Plex Mono, bottom-right corner, `bg.base` @ 70% opacity chip). No autoplay in the feed/thread — this is a chat-first app, not Reels; playback is always a deliberate tap.
- **Audio:** a compact horizontal player — play/pause button in `accent.default`, waveform rendered as vertical bars, **played portion in `accent.default`, unplayed portion in `border.strong`**, duration in Plex Mono at the right edge.
- **Send-quality control:** a small toggle in the composer ("Original quality") — off by default (compressed, fast), on for scans/notes where fidelity matters. This directly answers the Instagram compression complaint from your research.

---

## 22. Avatars & Presence

Circular avatars, two sizes only: 40px (chat list, DM header) and 32px (inline in message groups). Presence indicator: a small ring/dot overlaid at the bottom-right — solid `success` green (online), outline gray (offline), no "away" state in v1 (a third state is more accuracy than a student chat app actually needs, and it's one more thing to get wrong visually).

Group avatars in the conversation list show a 2-avatar overlapping cluster (not a generic group icon) when a custom group image hasn't been set.

---

## 23. Reactions & Reaction Picker

- A reaction appears as a small pill beneath the bubble: emoji + count, `bg.sunken` fill, `radius.sm`, tapped state gets a thin `accent.default` border to show "you reacted."
- Long-press (mobile) / hover-and-click (desktop) opens a **horizontal quick-picker** anchored directly above/below the message (never a centered modal) — 6 common reactions plus a "+" to expand the full emoji set. Appears with a fast scale+fade (120ms, see §28), never a slide-up sheet for this specific interaction — it needs to feel instant.

---

## 24. Empty States

Icon (single outline icon, 32px, `text.muted`) + one short sentence in `text.secondary` +, where relevant, one primary action button. **No mascot illustrations, no decorative graphics** — this is one of the clearest tells of generic AI-app design, and Beacon's restraint here is deliberate brand signal, not a missing feature.

Example: empty DM list → icon + "No conversations yet" + "Start a chat" primary button. Empty file library in a group → icon + "No files shared here yet."

---

## 25. Loading & Skeleton States

Flat **opacity-pulse placeholders** (0.4 → 1.0 → 0.4, 1.2s ease-in-out loop), shaped to match the real content (bubble-shaped skeletons in the chat list, card-shaped in file lists). **No gradient shimmer-sweep** — shimmer is the single most recognizable "generic AI-generated app" loading pattern, and a plain opacity pulse reads as more refined while being cheaper to render (relevant given §32).

Skeletons appear only after a 150ms delay (avoids skeleton-flash on fast local/cached loads) and never for real-time message delivery, which uses optimistic UI instead (see §27).

---

## 26. Error States

Inline and calm, not modal/alarmist:
- **Failed message send:** the bubble stays visible, dimmed slightly, with a small `error`-colored exclamation mark below-left and "Tap to retry" in `text.secondary` — no popup, no dialog.
- **Upload failure:** the file card's progress ring turns `error` color and the action icon becomes a retry icon.
- **Connectivity loss:** a slim, dismissible banner at the top of the chat pane ("Reconnecting…"), `warning` tone, auto-dismisses on reconnect — never a full-screen blocking error for something this recoverable.

---

## 27. Micro-interactions

- Button press: scale to 0.97, 100ms.
- Sent message: enters with a subtle rise+fade (8px translate + opacity 0→1, 180ms) — appears **optimistically**, before server confirmation, then a small single-tick-to-double-tick fade-morph on delivery, and a color shift on read (see semantic success color, used sparingly — just the tick color, not the whole bubble).
- Reaction added: emoji pops with a quick scale-overshoot-settle (1 → 1.15 → 1.0, 200ms) — the one place a slightly springier curve is appropriate, because it's a small delightful moment, not a structural transition.
- Typing indicator: three dots, staggered opacity wave, 1.2s loop.

---

## 28. Animation Principles, Durations & Easing

| Category | Duration | Easing |
|---|---|---|
| Micro (press, toggle, hover) | 100–150ms | `easeOutCubic` |
| Standard (panel open, tab switch) | 200–250ms | `easeInOutCubic` |
| Entrance (screen/route transition) | 280–320ms | `easeOutCubic` |
| Shared-element (media open, avatar → profile) | 300ms | `easeInOutCubic` |
| Reaction pop (the one springy exception) | 200ms | slight overshoot, `easeOutBack` (mild, not bouncy) |

General rule: **elastic/bounce curves are avoided everywhere except the single reaction-pop micro-moment** — bounce reads as playful/toy-like, which works against the "serious tool" brand. Every animation must be interruptible (a user swiping while a transition plays should never feel blocked), and every animation respects the OS-level reduced-motion setting by dropping to instant opacity/position changes.

---

## 29. Desktop Layout Behavior

- Minimum window size ~960×600; below that, the context panel auto-collapses first, then the conversation list collapses to icon-only rail.
- Hover reveals per-message actions (react / reply / more) as a small icon cluster at the bubble's top-right corner — hidden at rest to keep the thread visually quiet, present the instant it's useful.
- Keyboard-first affordances: `Ctrl/Cmd+K` global search, `Ctrl/Cmd+N` new conversation, `Enter` to send / `Shift+Enter` for newline, arrow-key navigation through the conversation list.
- Right-click opens a native-feeling context menu for message actions (copy, reply, delete, forward).

---

## 30. Mobile Layout Behavior

- Single-pane stack navigation; conversation list is the app's home.
- Swipe-to-reply on a message (a genuinely useful, now-expected gesture — kept despite the "don't clone WhatsApp" principle, because some patterns are utility, not brand).
- Compose bar is bottom-anchored, expands upward for the attachment menu (camera / gallery / file / sticker) rather than opening a separate full-screen sheet, to keep the sending flow fast.
- Full safe-area handling for notches/gesture bars on both iOS-style and Android devices.

---

## 31. Accessibility Requirements

- Minimum contrast: body text ≥ 4.5:1, secondary text ≥ 4.5:1 against its surface, large/heading text ≥ 3:1 — verified per token pair in §3, not assumed.
- Text scales with system font-size settings up to at least 130% without layout breakage (chat bubbles reflow, they don't clip).
- Minimum tap target 44×44px on mobile, even where the visible icon is smaller (invisible padding hit-area).
- All interactive elements reachable and operable via keyboard on desktop, with a visible focus ring using `accent.default` at 2px.
- Presence, read-receipt, and file-type signals are never color-only — presence pairs with shape (filled ring vs outline), file-type badges pair color with the extension text itself.
- Screen-reader labels on all icon-only buttons.

---

## 32. Performance Considerations (Low-End Dev Hardware)

Since you're developing solo on modest hardware, the design system is written to be cheap to render, not just to look good:

- **No `BackdropFilter`/blur anywhere** — it's one of the most expensive operations in Flutter's rendering pipeline; this doc's "no glassmorphism" rule is as much a performance decision as an aesthetic one.
- **Shadows are rare and shallow** (see §12) — cheap to rasterize, and used on floating elements only, which are a small fraction of on-screen widgets at any time.
- **Skeletons use opacity animation only**, never animated gradients — opacity animates on the compositor thread essentially for free; a moving gradient shimmer repaints every frame.
- **Message list must be virtualized** (`ListView.builder` / reversed lazy list) — never render the full conversation history at once, this is non-negotiable for smooth scrolling as threads grow into thousands of messages.
- **Per-item animations are disabled during fast scroll** (detect scroll velocity, suppress entrance animations above a threshold) — prevents jank when a user flings through a long history.
- **Images/thumbnails are lazy-loaded and cached**, never decoded at full resolution for a thumbnail-sized slot.
- **`const` constructors used aggressively** throughout the widget tree; `RepaintBoundary` wraps message bubbles so one updating bubble (e.g. a read-receipt tick change) doesn't repaint the whole list.
- Target: **stable 60fps on modest hardware** is the real bar — do not chase 120fps effects that cost more than they're worth on your actual dev machine or your students' likely mid-range phones.

---

## Design Decisions That Must Not Be Changed Casually

These are load-bearing for Beacon's identity and consistency. Revisiting any of them mid-build should be a deliberate decision, not a drive-by tweak:

1. **Beacon Amber (`#E8A23D` / `#F0B15A`) is the only accent color**, used exclusively for primary actions, active states, unread indicators, and focus. Introducing a second "loud" color anywhere breaks the whole "one point of light" concept the name is built on.
2. **No gradients, no glassmorphism, no glow/blur effects** in the working UI (the one narrow exception is the static splash mark).
3. **Font trio is fixed**: Inter (body/UI), General Sans (headings/wordmark), IBM Plex Mono (timestamps/metadata/file data). Swapping any of these changes the brand voice.
4. **Font weight ceiling is 600** — bold (700) is never used.
5. **4px spacing base unit** and the fixed scale in §9 — no arbitrary spacing values.
6. **Radius ceiling of 16px** app-wide; message bubble asymmetric-corner system (§18) is the bubble's defining visual trait — don't replace it with a literal speech-tail shape later.
7. **Shadows limited to the three-level system in §12** — no ad hoc drop shadows added per-component.
8. **No bottom tab bar on mobile** — the conversation list is the home screen; this is a structural decision, not just a style choice.
9. **Shimmer-sweep loading animations are explicitly rejected** in favor of opacity-pulse — this is a deliberate anti-pattern flag, not an oversight if someone reaches for a shimmer package later.
10. **Videos never autoplay in-thread** — this preserves the "chat-first, not Reels" identity even as media features expand.
11. **Elastic/bounce easing is reserved for the single reaction-pop moment only** — every other transition uses cubic easing.

Before real students use Beacon, enable email confirmation and decide whether Beacon should use domain restriction, invitations, or another access-control mechanism.