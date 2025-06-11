/// File needed for Swift Package Manager. Serves as a placeholder to satisfy the requirement of at least one source file in the target. This file does not contain any functional code.

#if os(tvOS)
@_exported import TVVLCKit
#elseif os(iOS)
@_exported import MobileVLCKit
#endif
