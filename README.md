# Bund Application README

## Overview

This Flutter application is developed for Bund, showcasing two primary screens:

- **Home Screen:**
    - Displays widgets from the provided Figma file.
    - Implements snap scrolling for dynamic card updates.
    - Features semi-transparent card overlays upon content updates.
- **Investment Screen:**
    - Replicates layout and design from the Figma file with high fidelity.
    - Provides an investment calculator with the following features:
        - Increments investment amount by $10,000 (or $1,000 below $10,000).
        - Minimum investment amount of $250.
        - Exponential incrementation when plus/minus buttons are held.
        - UX element indicating button hold functionality (visual cue or haptic feedback).

## Technical Specifications

- **Framework:** Flutter version 3.13.9
- **State Management:** BLoC
- **Local Storage:** Hive
- **Dependency Injection:** GetIt

## Setup and Running

1. Clone this repository.
2. Install dependencies: `flutter pub get`
3. Run the app: `flutter run`

## Key Features

- **Snap Scrolling:** Navigate between cards smoothly with snap scrolling.
- **Dynamic Card Updates:** Cards automatically refresh content with a subtle visual cue.
- **Investment Calculator:** Calculate investment returns with precise controls and exponential incrementation.
- **Intuitive UX:** Clear visual and haptic feedback for button interactions.

## Additional Notes

- Refer to the Figma file for detailed design specifications.
- Consider testing for different screen sizes and orientations.
- Explore opportunities for further feature additions or enhancements.
