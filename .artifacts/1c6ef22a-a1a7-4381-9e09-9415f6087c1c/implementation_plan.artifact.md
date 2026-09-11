# Implementation Plan - Project Health & UI Consistency

This plan addresses the immediate improvements identified during the project review, focusing on code quality, accessibility, and UI consistency.

## Proposed Changes

### Core Configuration & Quality
#### [MODIFY] [analysis_options.yaml](file:///Users/ajaycheruku/propertify_flutter_Latest/analysis_options.yaml)
- Add stricter linting rules (e.g., `always_declare_return_types`, `prefer_final_locals`, `avoid_unnecessary_containers`) to ensure better code health.

### Theming & Dead Code Cleanup
#### [MODIFY] [app_theme.dart](file:///Users/ajaycheruku/propertify_flutter_Latest/lib/core/app_theme.dart)
- Remove extensive blocks of commented-out code.
- Ensure consistent color naming.

### Accessibility
#### [MODIFY] [app.dart](file:///Users/ajaycheruku/propertify_flutter_Latest/lib/app.dart)
- Remove `textScaler: const TextScaler.linear(1.0)` to allow the app to respect system font size settings.

### UI Consistency (Proof of Concept)
#### [MODIFY] [agent_info.dart](file:///Users/ajaycheruku/propertify_flutter_Latest/lib/features/feed/presentation/widgets/agent_info.dart)
- Replace hardcoded colors (like `Colors.black`, `Colors.grey[50]`) with theme-based lookups (`Theme.of(context).primaryColor`, etc.).
- Remove commented-out code.

## Verification Plan

### Automated Tests
- Run `flutter analyze` to ensure no new linting errors are introduced by the stricter rules.

### Manual Verification
- Verify the app builds successfully.
- Check the Feed screen to ensure the `AgentInfo` widget still looks correct after theme integration.
- Test system font scaling on a device/emulator to verify accessibility improvement.
